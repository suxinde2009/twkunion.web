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
end