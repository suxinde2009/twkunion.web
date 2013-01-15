class UsersController < InheritedResources::Base
  before_filter :authenticate_user!, except: :show
  main_nav_highlight :settings

  def update
    update! do |format|
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
    elsif params.key?(:uid)
      end_of_association_chain.find_by_uid(params[:uid])
    else
      current_user
    end
  end
end
