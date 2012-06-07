# encoding: utf-8
ActiveAdmin.register TopicDownload do
  belongs_to :topic
  
  menu label: '专题资源'
end
