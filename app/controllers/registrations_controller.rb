class RegistrationsController < Devise::RegistrationsController

  def edit
    @main_nav = :settings
    
    super
  end

  def update
    @main_nav = :settings

    self.resource = resource_class.to_adapter.get!(send(:"current_#{resource_name}").to_key)

    case params[:type].to_sym
    when :password
      update_user_with_password
    else
      update_user_without_password
    end
  end

  protected

  def update_user_without_password
    if resource.update_without_password(resource_params)
      redirect_to :back, notice: 'You have successfully updated your Profile'
    else
      respond_with resource
    end
  end

  def update_user_with_password
    if resource.update_with_password(resource_params)
      if is_navigational_format?
        if resource.respond_to?(:pending_reconfirmation?) && resource.pending_reconfirmation?
          flash_key = :update_needs_confirmation
        end
        set_flash_message :notice, flash_key || :updated
      end
      sign_in resource_name, resource, :bypass => true
      # set_flash_message :notice, :updated
      respond_with resource, :location => after_update_path_for(resource)
    else
      clean_up_passwords resource
      flash[:alert] = resource.errors.full_messages
      respond_with resource
    end
  end
  
end