class TopicsController < InheritedResources::Base
  main_nav_highlight :topics

  def show
    @sec_nav = :home
    
    show!
  end
end
