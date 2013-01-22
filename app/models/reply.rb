class Reply
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  include Mongoid::MagicCounterCache

  field :content

  validates :content, presence: true

  belongs_to :user
  belongs_to :post
  counter_cache :post, using: 'replies'
  
  delegate :name, to: :user, prefix: true
end
