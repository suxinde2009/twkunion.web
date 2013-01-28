class TopicResource
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Symbolize
  include AutoIncrementSid
  include Recommendable

  field :title

  validates :title, :topic_id, presence: true

  belongs_to :topic, index: true
  
  delegate :title, to: :topic, prefix: true

  scope :order_by_timeline, order_by([:created_at, :desc])

  def human_type
    I18n.t("topic_resources.#{_type.underscore}")
  end
end
