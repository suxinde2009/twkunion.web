# encoding: utf-8
ActiveAdmin.register TopicVideo do
  belongs_to :topic
  
  menu label: '专题视频'

  ## Customizing form screen for topic article
  form do |f|
    f.inputs '视频基本信息' do
      f.input :title
      f.input :source
      f.input :cover, as: :file
      f.input :url
      f.input :widget, as: :text, input_html: { rows: 5 }
    end

    f.buttons
  end
end
