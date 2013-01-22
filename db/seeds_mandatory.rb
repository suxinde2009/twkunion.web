# encoding: utf-8

p 'create admin user'
admin = User.new(email: 'admin@twkunion.com', username: 'admin', password: 'admin2012', name: '吞噬管理员')
admin.confirm!

admin.mark_as_admin!

p 'creating bbs boards...'
file = Pathname.glob(Rails.root.join('lib/assets/images/*')).sample.open

board = Board.create(name: '吞食天地2ND', description: '吞食天地2ND', logo: file)
board.children.create(name: '官方发布', description: '2ND游戏发布,版本的更新,请关注此版', logo: file)
board.children.create(name: '玩家交流', description: '有关2ND的提问,交流,心得,攻略请发到这里', logo: file)

board = Board.create(name: '吞食家族', description: '吞食家族', logo: file)
board.children.create(name: '发布专区', description: '其他吞食游戏的发布', logo: file)
board.children.create(name: '玩家交流', description: '其他吞食游戏的提问,交流,心得,攻略', logo: file)

board = Board.create(name: '周边相关', description: '周边相关', logo: file)
board.children.create(name: '灌水闲聊', description: '吞迷灌水圣地', logo: file)

board = Board.create(name: '站务', description: '站务', logo: file)
board.children.create(name: '版务专区', description: '版务专区', logo: file)



