class Board
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Ancestry
  include AutoIncrementSid

  has_ancestry

  field :name
  field :ancestry
  field :logo
  field :description
  field :posts_count, type: Integer, default: 0

  mount_uploader :logo, PhotoUploader
  
  validates :name, presence: true, uniqueness: true
  validates :logo, presence: true

  # Relations
  has_many :posts
  has_and_belongs_to_many :admins, class_name: 'User'

  default_scope asc(:ancestry)
  scope :children, where(:ancestry.ne => nil)

  def admins_text
    admins.join(',')
  end

  def total_replies_count
    posts.sum(:replies_count).to_i
  end

end
