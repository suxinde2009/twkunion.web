class UsersController < InheritedResources::Base
  before_filter :authenticate_user!, except: :show

  def update
    update! do |format|
      format.html { redirect_to :back, notice: t('notifications.profile_updated')
    }
   end
  end

  protected

  def resource
    if params.key?(:username)
    elsif params.key?(:id)
      super
    else
      current_user
    end
  end
end
