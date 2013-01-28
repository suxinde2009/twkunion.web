class HomeController < ApplicationController
  main_nav_highlight :home

  def index
    @topics = Topic.recommended
    @latest_topic_resources = TopicResource.order_by_timeline.limit(4) 
    @latest_bbs_posts = Post.default_order.limit(4)
  end
  
end
