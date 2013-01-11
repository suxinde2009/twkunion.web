# encoding: utf-8
class UserMailer < ActionMailer::Base
  default :from => "吞食天地大同盟 <info@twkunion.com>"
  layout "mail"

  def registration_confirmation(user)
    common_mail(@user=user,"吞食天地大同盟注册确认邮件")
  end

  def reset_password(user)
    common_mail(@user=user,"吞食天地大同盟重设密码确认邮件")
  end

  def invite(email,inviter)
    @inviter = inviter
    attachments.inline['mail_logo.png'] = File.read("#{ASSET_PATH}/images/jumbotron/banner_home.png")
    mail(:to => email,:subject=>"您的好友邀请您加入吞食天地大同盟")
  end

  private
  def common_mail(user,subject)
    attachments.inline['mail_logo.png'] = File.read("#{ASSET_PATH}/images/jumbotron/banner_home.png")
    mail(:to => "#{user.name} <#{user.email}>",:subject=>subject)
  end
end


 