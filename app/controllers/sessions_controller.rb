class SessionsController < Devise::SessionsController

  # POST /resource/sign_in
  def create
    resource = warden.authenticate!(auth_options)
    @user = resource
    set_flash_message(:notice, :signed_in) if is_navigational_format?
    sign_in(resource_name, resource)

    respond_to do |format|
      format.js
      format.json
    end
  end

end
