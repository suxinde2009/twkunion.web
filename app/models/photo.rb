class Photo
  include Mongoid::Document
  include Mongoid::Timestamps

  field :data

  validates :data, presence: true

  belongs_to :photogenic, polymorphic: true

  mount_uploader :data, PhotoUploader
end
