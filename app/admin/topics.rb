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
  form do |f|
    f.inputs '基本属性' do
      f.input :title
      f.input :slug
      f.input :description
    end

    f.inputs '图片' do
      f.input :icon, as: :file
      f.input :logo, as: :file
      f.input :banner, as: :file
      f.input :full_screen, as: :file
    end

    f.buttons
  end
end
