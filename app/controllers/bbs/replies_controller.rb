class Bbs::RepliesController < Bbs::BaseController
  actions :show, :create
  
  before_filter :authenticate_user!, only: :create
  belongs_to :post

  def create
    @reply = end_of_association_chain.new(params[:reply])
    @reply.user = current_user

    create! do |format|
      format.js
    end
  end

end
