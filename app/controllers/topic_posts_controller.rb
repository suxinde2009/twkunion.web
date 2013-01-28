class TopicPostsController < InheritedResources::Base
  main_nav_highlight :topics
  sec_nav_highlight :articles
  actions :index, :show

  belongs_to :topic, finder: :find_by_sid, param: :topic_id

  before_filter :get_recommended_posts

  protected

  def collection
    @topic_posts ||= end_of_association_chain.page(params[:page])
  end

  def get_recommended_posts
    @posts ||= parent.topic_posts.recommended.limit(10)
  end
end
