# encoding: utf-8
ActiveAdmin.register BbsTopic do
  menu label: '论坛帖子', priority: 5

  ## Customizing index screen for bbs boards
  index do
    column :id
    column :title
    column :user do |topic|
      link_to topic.user_username, admin_user_path(topic.user)
    end
    column :bbs_board do |topic|
      topic.bbs_board_name
    end

    column :sticky
    column :is_recommended
    column :created_at do |topic|
      topic.created_at.to_date
    end

    column '置顶' do |topic|
      links = ''.html_safe

      links += link_to '全局置顶', resource_path(topic, event: :global), method: :put, class: 'member_link view_link'
      links += link_to '主板块置顶', resource_path(topic, event: :main_board), method: :put, class: 'member_link view_link'
      links += link_to '子板块置顶', resource_path(topic, event: :child_board), method: :put
    end

    default_actions
  end

  ## Customizing update action to support special event param
  member_action :update, method: :put do
    if params.key?(:event)
      resource.send("#{mark_sticky_under_[:event]}!")
      redirect_to :back, notice: '更新成功!'
    else
      super
    end
  end
end
