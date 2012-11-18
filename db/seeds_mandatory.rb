# encoding: utf-8

p 'create admin user'
admin = User.new(email: 'admin@twkunion.com', username: 'admin', password: 'password', name: '吞噬管理员')
admin.confirm!

admin.mark_as_admin!

p 'creating bbs boards...'

board = Board.create(name: '吞食天地2ND', description: '吞食天地2ND', logo: '/assets/examples/02.jpg')

board.children.create(
  name: '官方发布',
  logo: '/assets/examples/02.jpg',
  description: '2ND游戏发布,版本的更新,请关注此版'
)

board.children.create(
  name: '玩家交流',
  logo: '/assets/examples/02.jpg',
  description: '有关2ND的提问,交流,心得,攻略请发到这里'
)

board = Board.create(name: '吞食家族', description: '吞食家族', logo: '/assets/examples/02.jpg')

board.children.create(
  name: '发布专区',
  logo: '/assets/examples/02.jpg',
  description: '其他吞食游戏的发布'
)

board.children.create(
  name: '玩家交流',
  logo: '/assets/examples/02.jpg',
  description: '其他吞食游戏的提问,交流,心得,攻略'
)

board.children.create(
  name: 'children',
  logo: '/assets/examples/02.jpg',
  description: '与吞食有关的音乐,图片,文字策划,配音,等素材的分享'
)

board = Board.create(name: '周边相关', description: '周边相关', logo: '/assets/examples/02.jpg')

board.children.create(
  name: '灌水闲聊',
  logo: '/assets/examples/02.jpg',
  description: '吞迷灌水圣地'
)

board = Board.create(name: '站务', description: '站务', logo: '/assets/examples/02.jpg')
board.children.create(
  name: '版务专区',
  logo: '/assets/examples/02.jpg',
  description: '版务专区'
)



