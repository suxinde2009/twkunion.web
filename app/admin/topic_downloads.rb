# encoding: utf-8
ActiveAdmin.register TopicDownload do
  belongs_to :topic, finder: :find_by_sid, param: :topic_id
  
  menu label: '专题资源'

  index do
    column :sid
    column :title do |resource|
      link_to resource.title.truncate(15), resource_path(resource)
    end
    column :source_url
    column :updated_at

    default_actions
  end

  form do |f|
    f.inputs '基本信息' do
      f.input :title
      f.input :source_url
      f.input :is_recommended, as: :boolean
    end

    f.actions
  end

  show do |resource|
    attributes_table do
      row :id
      row :sid
      row :title
      row :is_recommended
      row :source_url
      row :created_at
      row :updated_at
    end
  end

  controller do
    def resource
      @topic_download ||= end_of_association_chain.find_by_sid(params[:id])
    end
  end
end
