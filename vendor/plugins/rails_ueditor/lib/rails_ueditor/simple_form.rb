module RailsUeditor
  module SimpleForm
    class UeditorInput < ::SimpleForm::Inputs::Base
      def input
        @builder.ueditor(attribute_name, input_html_options)
      end
    end
  end
end

::SimpleForm::FormBuilder.map_type :ueditor, :to => RailsUeditor::SimpleForm::UeditorInput