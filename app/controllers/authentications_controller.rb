class AuthenticationsController < Devise::OmniauthCallbacksController
  before_filter :authenticate_user!, only: :index
  main_nav_highlight :settings
  
  def index
    @providers = User.omniauth_providers
  end

  def weibo
    omniauth_process
  end
  
  def qq_connect
    omniauth_process
  end

  def destroy
    @authentication = current_user.authentications.find(params[:id])
    @authentication.destroy

    respond_to do |format|
      format.html { redirect_to authentications_path, notice: t('notifications.remove_provider_success') }
    end
  end

  protected

  def omniauth_process
    omniauth = request.env['omniauth.auth']
    authentication = Authentication.where(provider: omniauth.provider, uid: omniauth.uid.to_s).first

    if authentication
      set_flash_message(:notice, :signed_in)
      sign_in(:user, authentication.user)
      redirect_to radio_path
    elsif current_user
      authentication = Authentication.create_from_hash(current_user, omniauth)
      redirect_to radio_path, notice: t('notifications.add_provider_success')
    else
      session[:omniauth] = omniauth.except('extra')
      redirect_to new_user_registration_url, notice: t('notifications.fill_your_email')
    end
  end

  def after_omniauth_failure_path_for(scope)
    new_user_registration_path
  end
end
