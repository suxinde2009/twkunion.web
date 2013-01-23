module Recommendable
  extend ActiveSupport::Concern

  included do
    field :is_recommended, type: Boolean, default: false

    index({ is_recommended: 1 })

    scope :recommended,     where(is_recommended: true) 
    scope :not_recommended, where(is_recommended: false)
  end
  
  module InstanceMethods
    def mark_as_recommended!
      update_attribute(:is_recommended, true)
    end

    def mark_as_not_recommended!
      update_attribute(:is_recommended, false)
    end
  end

end