module ApplicationHelper

  def topic_resource_path(topic_resource)
    resource_name = topic_resource.class.name.underscore
    return send("topic_#{resource_name}_path", topic_resource.topic, topic_resource)
  end

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

  def sec_nav(name, options = {}, &block)
    if @sec_nav == name
      if options[:class]
        options[:class] += ' active'
      else
        options[:class] = 'active'
      end
    end
    content = capture(&block)
    content_tag(:li, content, options)
  end

  def user_avatar_link_to(user, size = :small)
    link_to '#', title: user.name, class: 'url', rel: 'contact' do
      image_tag user.avatar.send(size), class: 'photo'
    end
  end
end
