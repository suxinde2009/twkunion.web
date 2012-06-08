class Activity
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Symbolize

  ACTIONS = [:browse_topic, :like_topic, :add_discussion]

  field :action

  validates :action, :user_id, :auditable_id, :auditable_type, presence: true

  belongs_to :user
  belongs_to :auditable, polymorphic: true

  symbolize :action, in: ACTIONS, scopes: true, methods: true
end
