# encoding: utf-8
ActiveAdmin.register BbsBoard do
  menu label: '论坛板块', priority: 4

  ## Customizing index screen for bbs boards
  index do
    column :id

    column :logo do |board|
      image_tag(board.logo, size: '40x20')
    end

    column :name
    column :admin do |board|
      board.admins_text
    end
    column :ancestry do |board|
      board.root.name unless board.is_root?
    end

    column :depth do |board|
      case board.depth
      when 0
        '1级板块'
      when 1
        '2级板块'
      when 2
        '3级板块'
      end
    end

    default_actions
  end

  ## Customizing form screen for bbs boards
  form partial: 'form'

  ## Customizing show screen for bbs boards
  show do |board|
    attributes_table do
      row :id
      row :ancestry
      row :name
      row :description
      row :logo do
        image_tag board.logo
      end
      row :bbs_topics_count
    end
  end
end
