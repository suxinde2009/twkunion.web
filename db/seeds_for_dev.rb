# encoding: utf-8

require 'database_cleaner'
require Rails.root.join('spec', 'support/blueprints')

p '> drop db...'
Rake::Task['db:mongoid:drop'].invoke

Dir.glob(Rails.root.join('public', 'uploads', '**')).each { |dir| FileUtils.rm_rf(dir) }

require  Rails.root.join('db', 'seeds_mandatory')

p 'create test users.....'
30.times { User.make! }

p 'create test topics and resources...'
topic = Topic.make!(
  title: '吞食天地2nd',
  slug: 'twk2nd',
  description: '在本作中玩家扮演刘备，从第一章“黄巾之乱”开始，一直到最后篡改历史一统天下，总共分为八章。战斗过程除了普通攻击之外还有总攻击 和策略选项，体现了一定的战术性。'
)

10.times { TopicArticle.make!(topic: topic) }
5.times { TopicVideo.make!(topic: topic) }
5.times { TopicPhoto.make!(topic: topic) }


BbsBoard.children.each do |board|
  5.times { BbsTopic.make!(user: User.all.sample, bbs_board: board) }
end