class Message
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :content
  field :is_read, type: Boolean, default: false
  field :is_archived, type: Boolean, default: false
  
  validates :content, presence: true
  
  belongs_to :user, index: true
  belongs_to :target_user, class_name: 'User', index: true

  default_scope order_by([:is_read, :desc], [:created_at, :desc])
  scope :unread, where(is_read: false)
end