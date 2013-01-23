class HomeController < ApplicationController
  main_nav_highlight :home

  def index
    @topics = Topic.recommended
  end
  
end
