# encoding: utf-8
ActiveAdmin.register Board do
  menu label: '论坛板块', priority: 4
  
  filter :name, as: :string

  ## Customizing index screen for bbs boards
  index do
    column :sid

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
  form do |f|
    f.inputs '基本信息' do
      f.input :ancestry,
              as: :select,
              collection: Board.roots,
              prompt: true,
              input_html: { disabled: (!resource.new_record? && resource.is_root?) ? true : false },
              hint: '主板块无须修改此项。'
      f.input :name
      f.input :logo, as: :file, hint: f.template.image_tag(f.object.logo)
    end

    f.actions
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
      row :posts_count
    end
  end

  controller do
    def resource
      @board ||= end_of_association_chain.find_by_sid(params[:id])
    end
  end
end
