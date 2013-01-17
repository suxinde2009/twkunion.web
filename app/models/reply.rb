class Reply
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  include Mongoid::MagicCounterCache

  field :content

  validates :content, presence: true

  belongs_to :user
  belongs_to :bbs_post
  counter_cache :bbs_post, using: 'replies'
  
  delegate :name, to: :user, prefix: true
end
