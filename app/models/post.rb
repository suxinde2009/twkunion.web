class Post
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title
  field :content
  field :is_recommended, type: Boolean, default: false
  field :views_count, type: Integer, default: 0
  field :sid, type: Integer

  auto_increment :sid, seed: 0

  validates :title, :content, presence: true

  belongs_to :user, index: true

  delegate :name, to: :user, prefix: true
  delegate :email, to: :user, prefix: true

  # scope :involved_bbs_posts, ->(user_id) {
  #   where(:)
  # }

  %w(default recommended).each do |method|
    define_method("mark_as_#{method}!") do
      update_attribute(:is_recommended, method == 'default' ? false : true )
    end
  end

  def to_param
    sid
  end

  class << self
    def find_by_sid(sid)
      find_by(sid: sid)
    end
  end
end
