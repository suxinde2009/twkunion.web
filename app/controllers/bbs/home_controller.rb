class Bbs::HomeController < Bbs::BaseController
  actions only: :index
  main_nav_highlight :bbs
  
  def index
    @main_boards = Board.roots
  end
end
