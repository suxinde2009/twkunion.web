module ApplicationHelper
  def settings_link_to(text, url_options = {}, html_options = {})
    if current_page?(url_options)
      html_options[:class] = 'active'
    end

    content_tag(:li, html_options) do
      link_to(text, url_options)
    end
  end

  def main_nav(name, options = {}, &block)
    if @main_nav == name
      if options[:class]
        options[:class] += ' active'
      else
        options[:class] = 'active'
      end
    end
    content = capture(&block)
    content_tag(:li, content, options)
  end
end
