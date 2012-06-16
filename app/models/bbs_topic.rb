class BbsTopic
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Symbolize

  STICKY_TYPES = [:global, :main_board, :child_board]

  field :title
  field :content
  field :last_replied_at, type: Time
  field :last_updated_at, type: Time
  field :sticky
  field :is_recommended, type: Boolean, default: false

  validates :user_id, :title, :content, presence: true

  belongs_to :user
  belongs_to :bbs_board
  belongs_to :last_replied_by, class_name: 'User'

  symbolize :sticky, in: STICKY_TYPES, scopes: true, methods: true, validates: false, allow_blank: true

  delegate :name, to: :bbs_board, prefix: true
  delegate :username, to: :user, prefix: true

  # Here you can use three methods to set sticky for a single topic
  ## mark_sticky_under_global
  ## mark_sticky_under_main_board
  ## mark_sticky_under_child_board
  STICKY_TYPES.each do |type|
    define_method("mark_sticky_under#{type}!") do |method|
      update_attribute(sticky: method)
    end
  end
end
