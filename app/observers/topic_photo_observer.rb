class TopicPhotoObserver < Mongoid::Observer

  def after_create(object)
    object.topic.inc(:photos_count, 1)
  end

  def after_destroy(object)
    object.topic.inc(:photos_count, -1)
  end

end
