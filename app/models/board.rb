class Board
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Ancestry

  has_ancestry

  field :name
  field :ancestry
  field :logo
  field :description
  field :bbs_posts_count, type: Integer, default: 0
  
  validates :name, presence: true, uniqueness: true
  validates :logo, presence: true

  # Relations
  has_many :bbs_posts
  has_and_belongs_to_many :admins, class_name: 'User'

  # Delegates and Scopes
  delegate :name, to: :admin, prefix: true

  default_scope asc(:ancestry)
  scope :children, where(:ancestry.ne => nil)

  def admins_text
    admins.join(',')
  end

  def total_replies_count
    bbs_posts.sum(:replies_count).to_i
  end

end
