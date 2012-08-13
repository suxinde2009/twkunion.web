# encoding: utf-8

p 'create admin user'
admin = User.new(email: 'admin@twkunion.com', username: 'admin', password: 'password')
admin.confirm!

admin.mark_as_admin!
