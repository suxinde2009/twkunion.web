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
10.times do
  topic = Topic.make!
  topic.publish!

  10.times { TopicArticle.make!(topic: topic) }
  5.times { TopicVideo.make!(topic: topic) }
  5.times { TopicPhoto.make!(topic: topic) }
end

p 'create bbs related...'
5.times do
  main_board = BbsBoard.make!(admin: User.all.sample)
  3.times do
    child_board = BbsBoard.make!(ancestry: main_board.id.to_s, admin: User.all.sample)
    5.times { BbsTopic.make!(user: User.all.sample, bbs_board: child_board) }
  end
end