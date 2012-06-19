class BbsBoard
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Ancestry

  has_ancestry

  field :name
  field :ancestry
  field :logo
  field :description
  field :bbs_topics_count, type: Integer, default: 0

  validates :name, :logo, :description, presence: true
  validates :name, uniqueness: true

  mount_uploader :logo, OriginalUploader

  belongs_to :admin, class_name: 'User'

  has_many :topics, class_name: 'BbsTopic'

  delegate :name, to: :admin, prefix: true

  default_scope asc(:ancestry)
end
