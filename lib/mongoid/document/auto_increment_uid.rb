module Mongoid
  module Document
    module AutoIncrementUid
      module ClassMethods
        
      end
      
      module InstanceMethods
        def assign_auto_crement_uid
          o = Mongoid::Sessions.default.command({:findAndModify => "mongoid.auto_increment_ids",
                                                 :query  => { :uid => :users },
                                                 :update => { "$inc" => { :c => 1 } },
                                                 :upsert => true,
                                                 :new    => true })
        end
      end
      
      def self.included(base)
        base.class_eval do |ext|
          ext.field :uid, type: Integer
        end

        before_save :assign_auto_increment_uid

        base.extend         ClassMethods
        base.send :include, InstanceMethods
      end
    end
  end
end