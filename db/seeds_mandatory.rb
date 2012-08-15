# encoding: utf-8

p 'create admin user'
admin = User.new(email: 'admin@twkunion.com', username: 'admin', password: 'password')
admin.confirm!

admin.mark_as_admin!

# topic = admin.topics.create(
#   title: '吞食天地2nd',
#   slug: 'twk2nd',
#   description: '吞食天地2nd进化专题简介',
#   rating: 5,
#   logo: "/assets/examples/02.jpg"
# )