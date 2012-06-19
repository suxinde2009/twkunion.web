class Bbs::BoardsController < Bbs::BaseController
  defaults resource_class: BbsBoard

  actions only: :show

  def show
    @topics = resource.topics.page(params[:page])
  end
end
