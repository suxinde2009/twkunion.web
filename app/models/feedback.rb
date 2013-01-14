class Feedback
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title
  field :body

  validates :title, :body, presence: true
end
