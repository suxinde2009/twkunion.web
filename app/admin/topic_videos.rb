# encoding: utf-8
ActiveAdmin.register TopicVideo do
  belongs_to :topic
  
  menu label: '专题视频'
end
