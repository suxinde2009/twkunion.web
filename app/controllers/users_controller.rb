class UsersController < InheritedResources::Base
  before_filter :authenticate_user!, except: :show
  main_nav_highlight :settings

  def update
    update! do |format|
      logger.info "@@@@@@@@@@@"*20
      logger.info resource.errors.full_messages
      format.html { redirect_to :back, notice: t('notifications.profile_updated')
    }
   end
  end

  def notifications; end
  def friends; end

  protected

  def resource
    if params.key?(:id)
      super
    else
      current_user
    end
  end
end
