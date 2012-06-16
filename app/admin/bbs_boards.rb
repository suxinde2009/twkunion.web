# encoding: utf-8
ActiveAdmin.register BbsBoard do
  menu label: '论坛板块', priority: 4

  ## Customizing index screen for bbs boards
  index do
    column :id
    column :name
    column :admin do |board|
      link_to board.admin_name, admin_user_path(board.admin)
    end
    column :ancestry do |board|
      board.root.name unless board.is_root?
    end

    default_actions
  end

  ## Customizing form screen for bbs boards
  form do |f|
    f.inputs '板块基本信息' do
      f.input :ancestry, as: :select, collection: BbsBoard.roots, prompt: false
      f.input :name
      f.input :logo, as: :file
      f.input :description, as: :text, input_html: { rows: 5 }
      f.input :admin_id
    end

    f.buttons
  end

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
