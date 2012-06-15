class BbsBoard
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name
  field :logo
  field :description
  field :bbs_topics_count, type: Integer, default: 0

  belongs_to :admin, class_name: 'User'
end
