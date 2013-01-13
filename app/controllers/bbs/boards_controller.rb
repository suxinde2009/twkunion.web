class Bbs::BoardsController < Bbs::BaseController
  actions only: :show

  def show
    @posts = resource.bbs_posts.page(params[:page])
  end
end
