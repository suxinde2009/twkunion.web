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

  validates :name, presence: true, uniqueness: true

  has_many :topics, class_name: 'BbsTopic'

  delegate :name, to: :admin, prefix: true

  default_scope asc(:ancestry)
  scope :children, where(:ancestry.ne => nil)
  
  has_and_belongs_to_many :admins, class_name: 'User'
end
