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
end
