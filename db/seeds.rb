# encoding: utf-8

p '> drop db...'
Rake::Task['db:mongoid:drop'].invoke

Dir.glob(Rails.root.join('public', 'uploads', '**')).each { |dir| FileUtils.rm_rf(dir) }

require  Rails.root.join('db', 'seeds_mandatory')