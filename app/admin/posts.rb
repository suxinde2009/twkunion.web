# encoding: utf-8

ActiveAdmin.register Post do
  menu label: '论坛帖子', priority: 5

  scope :all, default: true
  scope :recommend

  filter :title, as: :string

  ## Customizing index screen for bbs boards
  index do
    column :sid
    column :title do |resource|
      resource.title.try(:truncate, 10)
    end
    column :user do |resource|
      link_to resource.user_name, admin_user_path(resource.user)
    end
    column :board do |resource|
      resource.board.try(:name)
    end

    column :sticky do |resource|
      resource.sticky_text
    end
    
    column :created_at do |resource|
      resource.created_at.to_date
    end

    column :replies_count

    column '置顶' do |resource|
      links = ''.html_safe

      links += link_to '全局置顶', resource_path(resource, event: :global), method: :put, class: 'member_link view_link' unless resource.global?
      links += link_to '主板块置顶', resource_path(resource, event: :main_board), method: :put, class: 'member_link view_link' unless resource.main_board?
      links += link_to '子板块置顶', resource_path(resource, event: :child_board), method: :put unless resource.child_board?
    end

    default_actions
  end

  form do |f|
    f.inputs '基本信息' do
      f.input :title
      f.input :sticky, as: :select, collection: Post.get_sticky_values, prompt: true
      f.input :content, as: :kindeditor, input_html: { width: 800, height: 300 }
    end

    f.actions
  end

  show do |resource|
    attributes_table do
      row :id
      row :sid
      row :title
      row :sticky_text
      row :last_replied_at
      row :last_replied_by
      row :replies_count
      row :user
      row :board
      row :content do
        raw resource.content
      end
      row :created_at
      row :updated_at
    end
  end

  controller do
    def resource
      @post ||= end_of_association_chain.find_by_sid(params[:id])
    end

    def update
      if params.key?(:event)
        resource.send("mark_sticky_under_#{params[:event]}!")
        redirect_to :back, notice: '更新成功!'
      else
        super
      end
    end
  end

end
