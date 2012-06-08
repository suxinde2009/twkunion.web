class TopicVideoObserver < Mongoid::Observer

  def after_create(object)
    object.topic.inc(:videos_count, 1)
  end

  def after_destroy(object)
    object.topic.inc(:videos_count, -1)
  end

end
