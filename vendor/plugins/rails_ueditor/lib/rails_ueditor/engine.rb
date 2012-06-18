require "rails_ueditor"
require "rails"
require "action_controller"

module RailsUeditor
  class Engine < Rails::Engine
    
    initializer "rails_ueditor.assets_precompile" do |app|
      app.config.assets.precompile += RailsUeditor.assets
    end
    
    initializer "rails_ueditor.methods" do
      ActionController::Base.send(:include, RailsUeditor::ControllerAdditions)
    end
    
    initializer "rails_ueditor.simple_form_and_formtastic" do
      require "rails_ueditor/simple_form" if Object.const_defined?("SimpleForm")
      require "rails_ueditor/formtastic" if Object.const_defined?("Formtastic")
    end
    
    initializer "rails_ueditor.helper_and_builder" do
      ActiveSupport.on_load :action_view do
        ActionView::Base.send(:include, RailsUeditor::Helper)
        ActionView::Helpers::FormBuilder.send(:include, RailsUeditor::Builder)
      end
    end
    
  end
end