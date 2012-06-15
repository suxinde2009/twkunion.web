class BbsTopic
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Symbolize

  field :title
  field :content
  field :last_replied_at, type: Time
  field :last_updated_at, type: Time
  field :sticky
  field :is_recommended, type: Boolean, default: false

  belongs_to :user
  belongs_to :last_replied_by, class_name: 'User'

  symbolize :sticky, in: [:global, :main_board, :child_board], \
            scopes: true, methods: true, validates: false, allow_blank: true
end
