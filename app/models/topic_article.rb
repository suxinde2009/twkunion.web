class TopicArticle < Article

  field :author
  field :source
  field :category, type: Integer
  field :views_count, type: Integer, default: 0

  validates :category, presence: true

  belongs_to :topic

  def self.category_mappings
    categories = Settings.topic.article_categories

    categories.zip (1..categories.size).to_a
  end

  def category_name
    self.class.category_mappings.select { |x| x.last == category }.flatten.first
  end
end