# encoding: utf-8
ActiveAdmin.register TopicPhoto do
  belongs_to :topic
  
  menu label: '专题图片'
end
