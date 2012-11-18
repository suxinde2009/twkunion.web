class Reply
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  include Mongoid::MagicCounterCache

  field :content

  belongs_to :user
  belongs_to :bbs_post
  counter_cache :bbs_post, field: 'replies'
end
