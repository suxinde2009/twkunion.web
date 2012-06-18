class Bbs::BoardsController < Bbs::BaseController
  defaults resource_class: BbsBoard

  actions only: :show
end
