class Bbs::HomeController < Bbs::BaseController
  actions only: :index
  
  def index
    @main_boards = BbsBoard.roots
  end
end
