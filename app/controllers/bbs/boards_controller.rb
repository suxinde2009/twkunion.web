class Bbs::BoardsController < Bbs::BaseController
  actions only: :show

  def show
    @posts = resource.bbs_posts.page(params[:page])
  end

  protected

  def resource
    @post ||= end_of_association_chain.find_by(sid: params[:id])
  end
end
