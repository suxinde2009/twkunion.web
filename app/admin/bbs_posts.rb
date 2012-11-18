# encoding: utf-8
ActiveAdmin.register BbsPost do
  menu label: '论坛帖子', priority: 5

  ## Customizing index screen for bbs boards
  index do
    column :id
    column :title
    column :user do |resource|
      link_to resource.user_username, admin_user_path(resource.user)
    end
    column :bbs_board do |resource|
      resource.bbs_board_name
    end

    column :sticky do |resource|
      resource.sticky_text
    end
    column :is_recommended
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

  ## Customizing update action to support special event param
  member_action :update, method: :put do
    if params.key?(:event)
      resource.send("mark_sticky_under_#{params[:event]}!")
      redirect_to :back, notice: '更新成功!'
    else
      super
    end
  end

  controller do
    ## Overrides for collection
    def collection
      @bbs_topics = end_of_association_chain.default_order.page(params[:page])
    end
  end
end
