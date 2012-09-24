# encoding: utf-8
ActiveAdmin.register TopicPhoto do
  belongs_to :topic
  
  menu label: '专题图片'

  ## Customizing index screen for topic photos
  # index do
  #   column :id
  #   column :title
  #   column :data

  #   default_actions
  # end

  index as: :grid do |photo|
    link_to image_tag(photo.data.url), resource_path(photo)
  end
end
