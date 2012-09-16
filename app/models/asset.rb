class Asset
  include Mongoid::Document
  include Mongoid::Timestamps

  field :data

  validates :data, presence: true
end
