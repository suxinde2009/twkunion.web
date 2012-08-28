class TopicsController < InheritedResources::Base
  main_nav_highlight :topics

  def show
    @sec_nav = :home
    
    @articles = resource.topic_articles.limit(10)
    @photos = resource.topic_photos.limit(10)

    show!
  end
end
