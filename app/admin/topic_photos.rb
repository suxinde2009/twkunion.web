# encoding: utf-8
ActiveAdmin.register TopicPhoto do
  belongs_to :topic, finder: :find_by_sid, param: :topic_id
  
  menu label: '专题图片'

  ## Customizing index screen for topic photos
  # index do
  #   column :id
  #   column :title
  #   column :data

  #   default_actions
  # end

  index as: :grid do |photo|
    link_to image_tag(photo.data.url), resource_path(photo)
  end

  form do |f|
    f.inputs '基本信息' do
      f.input :title
      f.input :is_recommended, as: :boolean
      f.input :data, as: :file, hint: f.template.image_tag(f.object.data)
    end

    f.actions
  end

  show do |resource|
    attributes_table do
      row :id
      row :sid
      row :topic
      row :title
      row :data do
        image_tag resource.data.url
      end
      row :created_at
      row :updated_at
    end
  end

  controller do
    def resource
      @topic_photo ||= end_of_association_chain.find_by_sid(params[:id])
    end
  end
end
