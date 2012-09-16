class AssetPhoto < Asset
  belongs_to :photogenic, polymorphic: true

  mount_uploader :data, PhotoUploader
end
