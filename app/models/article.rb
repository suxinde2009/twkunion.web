class Article
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title
  field :content
  field :is_top, type: Boolean, default: false

  belongs_to :user
end
