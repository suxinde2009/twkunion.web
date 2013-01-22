# encoding: utf-8
ActiveAdmin.register User do
  menu label: '用户', priority: 1

  filter :name, as: :string
  filter :email, as: :string

  index do
    column :uid
    column :name
    column :email
    column :confirmed_at

    default_actions
  end

  form do |f|
    f.inputs '基本信息' do
      f.input :email
      f.input :name
      f.input :password
      f.input :avatar, as: :file, hint: f.template.image_tag(f.object.avatar)
      f.input :bio, as: :text, input_html: { rows: 5 }
    end

    f.actions
  end

  show do
    attributes_table do
      row :id
      row :email
      row :name
      row :avatar do |user|
        image_tag(user.avatar.url) if user.avatar.url
      end
      row :bio
      row :posts_count
      row :confirmed_at
      row :sign_in_count
      row :last_sign_in_at
      row :current_sign_in_ip
    end
  end

  controller do
    def resource
      @user ||= end_of_association_chain.find_by_uid(params[:id])
    end
  end
end
