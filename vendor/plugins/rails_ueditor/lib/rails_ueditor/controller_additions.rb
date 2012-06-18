module RailsUeditor
  module ControllerAdditions
    module ClassMethods
      def include_Ueditor(options = {})
        proc = Proc.new do |c|
          c.instance_variable_set(:@use_ueditor, true)
        end
        before_filter(proc, options)
      end
    end

    def self.included(base)
      base.extend ClassMethods
    end
  end
end

