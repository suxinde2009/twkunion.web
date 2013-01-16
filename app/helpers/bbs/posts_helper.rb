# encoding: utf-8
module Bbs::PostsHelper

  def replies_count(post)
    if post.replies_count.zero?
      "暂时还没有回复"
    else
      "共收到#{post.replies_count}条回复"
    end
  end
end
