class Post
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Symbolize
  include Mongoid::MagicCounterCache
  include AutoIncrementSid

  STICKY_TYPES = [:global, :main_board, :child_board]

  field :title
  field :content
  field :sticky
  field :last_replied_at, type: Time
  field :replies_count, type: Integer, default: 0
  field :views_count, type: Integer, default: 0

  validates :title, :content, presence: true

  has_many :replies
  
  belongs_to :board, index: true
  belongs_to :user, index: true
  belongs_to :last_replied_by, class_name: 'User'

  counter_cache :user, using: 'posts'
  counter_cache :board, using: 'posts'

  delegate :name, to: :user, prefix: true
  delegate :email, to: :user, prefix: true
  delegate :name, to: :board, prefix: true

  symbolize :sticky, in: STICKY_TYPES, scopes: true, methods: true, validates: false, allow_blank: true

  scope :default_order, desc(:updated_at)

  # Here you can use three methods to set sticky for a single topic
  ## mark_sticky_under_global
  ## mark_sticky_under_main_board
  ## mark_sticky_under_child_board
  STICKY_TYPES.each do |method|
    define_method("mark_sticky_under_#{method}!") {
      update_attribute(:sticky, method)
    }
  end
end
