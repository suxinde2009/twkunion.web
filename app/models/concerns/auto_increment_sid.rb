module AutoIncrementSid
  extend ActiveSupport::Concern

  included do
    field :sid, type: Integer

    auto_increment :sid
  end

  def to_param
    sid
  end
  
  module ClassMethods
    def find_by_sid(sid)
      find_by(sid: sid)
    end
  end

end
