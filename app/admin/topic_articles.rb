# encoding: utf-8
ActiveAdmin.register TopicArticle do
  belongs_to :topic
  
  menu label: '专题文章'

  ## Customizing index screen for topic article
  index do
    column :id
    column :title
    column :category do |article|
      article.category_name
    end

    column :author
    column :source
    column :is_recommended

    column '其他操作' do |article|
      if article.is_recommended?
        link_to '取消推荐', resource_path(article, event: :mark_as_default), method: :put
      else
        link_to '推荐', resource_path(article, event: :mark_as_recommended), method: :put
      end
    end

    default_actions
  end

  ## Customizing update action to support special event param
  member_action :update, method: :put do
    if params.key?(:event)
      resource.send("#{params[:event]}!")
      redirect_to :back, notice: '更新成功!'
    else
      super
    end
  end

  ## Customizing form screen for topic article
  form do |f|
    f.inputs '专题文章基本信息' do
      f.input :title
      f.input :category, as: :select, collection: TopicArticle.category_mappings, prompt: true
      f.input :author
      f.input :source
      f.input :content, as: :kindeditor, input_html: { height: 400, width: 920 }
    end

    f.buttons
  end

  ## Customizing show screen for topic article
  show do |article|
    attributes_table do
      row :id
      row :title
      row :category do
        article.category_name
      end

      row :author
      row :source
      row :is_recommended

      row :content do
        raw article.content
      end
    end
  end
end
