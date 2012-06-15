class BbsReply
  include Mongoid::Document
  include Mongoid::Timestamps

  field :content

  belongs_to :user
  belongs_to :bbs_topic
end
