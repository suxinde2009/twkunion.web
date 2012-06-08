# encoding: utf-8
ActiveAdmin.register TopicVideo do
  belongs_to :topic
  
  menu label: '专题视频'

  ## Customizing form screen for topic video
  form do |f|
    f.inputs '视频基本信息' do
      f.input :title
      f.input :source
      f.input :cover, as: :file
      image_tag resource.cover.url
      f.input :url
      f.input :widget, as: :text, input_html: { rows: 5 }
    end

    f.buttons
  end

  ## Customizing show screen for topic video
  show do |video|
    attributes_table do
      row :id
      row :topic_id do
        link_to video.topic_title, [:admin, video.topic]
      end
      row :title
      row :source
      row :url do
        link_to video.url, video.url, target: '_blank'
      end

      row :widget do
        raw video.widget
      end
    end
  end
end
