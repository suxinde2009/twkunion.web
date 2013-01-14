module Concerns::SocialConnection
  extend ActiveSupport::Concern

  CONNECTIONS = %w(weibo qq_connect douban)

  CONNECTIONS.each do |method|
    define_method(method) { authentications.where(provider: method).first }
  end

  def authenticated_with?(provider)
    !!send(provider.to_sym)
  end
  
  def authenticated_providers
    authentications.map(&:provider)
  end
  
  def user_info(provider)
    case provider.to_sym
    when :weibo
      Sns::Tsina.new(self.tsina.token, self.tsina.secret).user_info(self.tsina.uid)
    end
  end

  def friends(provider)
    case provider.to_sym
    when :weibo
      Sns::Tsina.new(self.tsina.token, self.tsina.secret).friends(self.tsina.uid)
    end
  end

  def add_post(provider, content, file = nil)
    case provider.to_sym
    when :weibo
      Sns::Tsina.new(self.tsina.token, self.tsina.secret).add_post(content, file)
    end
  end

end
