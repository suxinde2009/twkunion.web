class RegistrationsController < Devise::RegistrationsController
  main_nav_highlight :settings

  # POST /resource
  def create
    build_resource

    if resource.save
      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up if is_navigational_format?
        sign_up(resource_name, resource)

        # Customize, clean up omniauth session
        session['omniauth'] = nil

        respond_with resource, :location => after_sign_up_path_for(resource)
      else
        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_navigational_format?
        expire_session_data_after_sign_in!
        respond_with resource, :location => after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      respond_with resource
    end
  end

  protected

  # Build a devise resource passing in the session. Useful to move
  # temporary session data to the newly created user.
  def build_resource(hash=nil)
    super
    omniauth = session['omniauth']

    if omniauth
      self.resource.confirmed_at = Time.zone.now
      self.resource.authentications.build(
        {
          provider: omniauth.provider,
          uid: omniauth.uid,
          access_token: omniauth.credentials.token
        }
      )
    end
  end

  # The path used after sign up. You need to overwrite this method
  # in your own RegistrationsController.
  def after_sign_up_path_for(resource)
    new_user_session_path
  end

  def after_inactive_sign_up_path_for(resource)
    new_user_session_path
  end
  
end
