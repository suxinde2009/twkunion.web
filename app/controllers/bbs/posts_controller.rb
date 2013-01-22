class Bbs::PostsController < Bbs::BaseController
  before_filter :authenticate_user!, only: [:new, :create]

  belongs_to :board, finder: :find_by_sid, param: :board_id

  actions :index, :show, :new, :create

  def create
    @post = end_of_association_chain.new(params[:post])
    @post.user = current_user

    create! { resource_path }
  end

  protected

  def resource
    @post ||= end_of_association_chain.find_by_sid(params[:id])  
  end
end