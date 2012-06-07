# encoding: utf-8
ActiveAdmin.register TopicArticle do
  belongs_to :topic
  
  menu label: '专题文章'
end
