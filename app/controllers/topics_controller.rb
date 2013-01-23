class TopicsController < InheritedResources::Base
  main_nav_highlight :topics

  def index
    @posts = TopicPost.limit(10)
    index!
  end

  def show
    @sec_nav = :home
    
    @posts = resource.topic_posts.limit(10)
    @photos = resource.topic_photos.limit(10)

    show!
  end

  protected

  def collection
    @topics ||= end_of_association_chain.page(params[:page])  
  end

  def resource
    @topic ||= end_of_association_chain.find_by_sid(params[:id])
  end
end
