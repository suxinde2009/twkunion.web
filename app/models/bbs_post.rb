class BbsPost < Post
  include Mongoid::Symbolize
  include Mongoid::MagicCounterCache

  STICKY_TYPES = [:global, :main_board, :child_board]

  field :last_replied_at, type: Time
  field :sticky
  field :replies_count, type: Integer, default: 0

  has_many :replies
  
  belongs_to :board
  belongs_to :user
  belongs_to :last_replied_by, class_name: 'User'

  counter_cache :user, using: 'bbs_posts'
  counter_cache :board, using: 'bbs_posts'

  symbolize :sticky, in: STICKY_TYPES, scopes: true, methods: true, validates: false, allow_blank: true

  delegate :name, to: :board, prefix: true
  delegate :name, to: :user, prefix: true

  scope :default_order, desc(:updated_at)
  scope :recommend, where(is_recommend: true)

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
