class ReplyObserver < Mongoid::Observer

  def after_create(resource)
    bbs_post = resource.bbs_post
    bbs_post.last_replied_by = resource.user
    bbs_post.last_replied_at = Time.zone.now
    bbs_post.save(validate: false)
  end

end
