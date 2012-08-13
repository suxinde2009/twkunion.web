module ApplicationHelper
  def settings_link_to(text, url_options = {}, html_options = {})
    if current_page?(url_options)
      html_options[:class] = 'active'
    end

    content_tag(:li, html_options) do
      link_to(text, url_options)
    end
  end
end
