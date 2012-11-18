class Bbs::BoardsController < Bbs::BaseController
  actions only: :show

  def show
    @topics = resource.bbs_posts.page(params[:page])
  end
end
