# encoding: utf-8
ActiveAdmin.register Topic do
  menu label: '专题', priority: 2

  filter :title, as: :string

  ## Customizing index screen for topic
  index do
    column :sid
    column :logo do |topic|
      image_tag topic.logo, height: 20
    end
    column :title
    column :rating

    column :posts_count do |topic|
      link_to topic.posts_count, [:admin, topic, :topic_posts]
    end

    column :videos_count do |topic|
      link_to topic.videos_count, [:admin, topic, :topic_videos]
    end

    column :photos_count do |topic|
      link_to topic.photos_count, [:admin, topic, :topic_photos]
    end

    column :downloads_count do |topic|
      link_to topic.downloads_count, [:admin, topic, :topic_downloads]
    end

    column :published_at do |topic|
      if topic.is_published?
        topic.published_at.to_date
      else
        link_to '发布', resource_path(topic, event: 'publish'), method: :put, confirm: '确定要发布吗?'
      end
    end

    default_actions
  end

  ## Customizing form screen for topic
  form do |f|
    f.inputs '基本信息' do
      f.input :title
      f.input :rating, hint: '请输入1,2,3,4,5的分值'
      f.input :description, as: :text, input_html: { rows: 5 }
      f.input :logo, as: :file, hint: f.template.image_tag(f.object.logo)
      f.input :banner, as: :file, hint: f.template.image_tag(f.object.banner)
    end

    f.actions
  end

  ## Customizing show screen for bbs boards
  show do |resource|
    attributes_table do
      row :id
      row :sid
      row :title
      row :description
      row :rating
      row :is_published
      row :published_at
      row :posts_count
      row :photos_count
      row :videos_count
      row :downloads_count

      row :logo do
        image_tag resource.logo, size: '200x80' if resource.logo
      end
      row :banner do
        image_tag resource.banner, size: '200x80' if resource.banner
      end
    end
  end

  controller do
    def resource
      @topic ||= end_of_association_chain.find_by_sid(params[:id])
    end

    def update
      if params.key?(:event)
        resource.send("#{params[:event]}!")
        redirect_to :back, notice: '操作成功!'
      else
        super
      end
    end
  end
end
