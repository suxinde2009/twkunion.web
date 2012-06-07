# encoding: utf-8
ActiveAdmin.register User do
  menu label: '用户'

  index do
    column :id
    column :username
    column :email
    column :confirmed_at

    default_actions
  end
end
