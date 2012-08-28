class TopicPhotosController < InheritedResources::Base
  main_nav_highlight :topics
  sec_nav_highlight :photos
  actions :index, :show

  belongs_to :topic

  before_filter :get_topic

  protected

  def get_topic
    @topic ||= parent
  end
end
