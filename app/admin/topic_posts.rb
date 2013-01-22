# encoding: utf-8
ActiveAdmin.register TopicPost do
  belongs_to :topic, finder: :find_by_sid, param: :topic_id
  
  menu label: '专题文章'

  ## Customizing index screen for topic article
  index do
    column :sid
    column :title do |resource|
      link_to resource.title.truncate(15), resource_path(resource), title: resource.title
    end
    column :category do |resource|
      resource.category_name
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

  ## Customizing form screen for topic article
  form do |f|
    f.inputs '基本信息' do
      f.input :title
      f.input :category, as: :select, collection: TopicPost.category_mappings, prompt: true
      f.input :author
      f.input :source
      f.input :is_recommended, as: :boolean
      f.input :content, as: :kindeditor, input_html: { height: 400, width: 820 }
    end

    f.actions
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

  controller do
    def resource
      @topic_post ||= parent.topic_posts.find_by_sid(params[:id])
    end

    def update
      if params.key?(:event)
        resource.send("#{params[:event]}!")
        redirect_to :back, notice: '更新成功!'
      else
        super
      end
    end
  end
end
