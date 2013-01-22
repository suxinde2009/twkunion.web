class ReplyObserver < Mongoid::Observer

  def after_create(resource)
    post = resource.post
    post.last_replied_by = resource.user
    post.last_replied_at = Time.zone.now
    post.save(validate: false)
  end

end
