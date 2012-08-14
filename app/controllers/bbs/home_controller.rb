class Bbs::HomeController < Bbs::BaseController
  actions only: :index

  def new
    @main_boards = BbsBoard.roots
  end
  
  def index
    @main_boards = BbsBoard.roots
  end
end
