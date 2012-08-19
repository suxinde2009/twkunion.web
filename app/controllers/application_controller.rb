class ApplicationController < ActionController::Base
  protect_from_forgery

  def authenticate_active_admin_user!
    authenticate_user!

    redirect_to root_path, alert: 'Unauthorized Access!' unless current_user.is_admin?
  end

  def self.main_nav_highlight(name)
    before_filter { |c| c.instance_variable_set(:@main_nav, name) }
  end

  def self.sec_nav_highlight(name)
    before_filter { |c| c.instance_variable_set(:@sec_nav, name) }
  end

  def after_sign_in_path_for(resource_or_scope)
    if resource_or_scope.is_admin?
      admin_root_path
    else
      super
    end
  end
end
