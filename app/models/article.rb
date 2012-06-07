class Article
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title
  field :content
  field :is_recommended, type: Boolean, default: false

  validates :title, :content, presence: true

  belongs_to :user, index: true

  %w(default recommended).each do |method|
    define_method("mark_as_#{method}!") do
      update_attribute(:is_recommended, method == 'default' ? false : true )
    end
  end
end
