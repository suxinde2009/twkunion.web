class Bbs::PostsController < Bbs::BaseController
  before_filter :authenticate_user!, only: [:new, :create]

  defaults resource_class: BbsPost, collection_name: 'bbs_posts', instance_name: 'bbs_post'
  belongs_to :board, finder: :find_by_sid, param: :board_id

  actions :index, :show, :new, :create

  def create
    @bbs_post = end_of_association_chain.new(params[:bbs_post])
    @bbs_post.user = current_user

    create! { resource_path }
  end
end