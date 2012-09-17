# encoding: utf-8
ActiveAdmin.register Topic do
  menu label: '专题', priority: 2

  ## Customizing index screen for topic
  index do
    column :id
    column :logo do |topic|
      image_tag topic.logo
    end
    column :title
    column :slug
    column :rating

    column :articles_count do |topic|
      link_to topic.articles_count, [:admin, topic, :topic_articles]
    end

    column :videos_count do |topic|
      link_to topic.videos_count, [:admin, topic, :topic_videos]
    end

    column :photos_count do |topic|
      link_to topic.photos_count, [:admin, topic, :topic_photos]
    end

    column :downloads_count do |topic|
      link_to topic.downloads_count, [:admin, topic, :topic_downloads]
    end

    column :published_at

    default_actions
  end

  ## Customizing form screen for topic
  form partial: 'form'

  ## Customizing show screen for bbs boards
  show do |resource|
    attributes_table do
      row :id
      row :title
      row :slug
      row :description
      row :rating
      row :is_published
      row :published_at
      row :articles_count
      row :photos_count
      row :videos_count
      row :downloads_count

      row :icon do
        image_tag resource.icon, size: '200x80' if resource.icon
      end
      row :logo do
        image_tag resource.logo, size: '200x80' if resource.logo
      end
      row :banner do
        image_tag resource.banner, size: '200x80' if resource.banner
      end
    end
  end
end
