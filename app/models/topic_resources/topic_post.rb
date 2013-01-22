class TopicPost < TopicResource
  include Mongoid::MagicCounterCache

  field :author
  field :source
  field :category, type: Integer
  field :content

  validates :category, presence: true

  # There will be a field 'posts_count' in post attributes
  counter_cache :topic, using: 'posts'

  def self.category_mappings
    categories = Settings.topic.article_categories

    categories.zip (1..categories.size).to_a
  end

  def category_name
    self.class.category_mappings.select { |x| x.last == category }.flatten.first
  end
end