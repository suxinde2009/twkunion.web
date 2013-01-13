class User
  include Mongoid::Document
  include Mongoid::Timestamps
  include Concerns::SocialConnection
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise  :database_authenticatable,
          :registerable,
          :recoverable,
          :rememberable,
          :trackable,
          :validatable,
          :confirmable,
          :token_authenticatable,
          :omniauthable, omniauth_providers: [:weibo, :qq_connect]

  ## Database authenticatable
  field :email
  field :encrypted_password

  ## Custom Columns
  field :uid, type: Integer
  field :name
  field :avatar
  field :bio
  field :is_admin, type: Boolean, default: false

  ## Recoverable
  field :reset_password_token
  field :reset_password_sent_at, type: Time

  ## Rememberable
  field :remember_created_at, type: Time
  field :remember_token

  ## Trackable
  field :sign_in_count,      type: Integer, default: 0
  field :current_sign_in_at, type: Time
  field :last_sign_in_at,    type: Time
  field :current_sign_in_ip
  field :last_sign_in_ip

  ## Confirmable
  field :confirmation_token
  field :confirmed_at,         type: Time
  field :confirmation_sent_at, type: Time
  field :unconfirmed_email # Only if using reconfirmable

  ## Inviteable
  # field :invitation_token, type: String, limit: 60
  # field :invitation_sent_at, type: String
  # field :invitation_accepted_at, type: String
  # field :invitation_limit, type: String
  # field :invited_by_type, type: String

  ## Lockable
  # field :failed_attempts, :type => Integer, :default => 0 # Only if lock strategy is :failed_attempts
  # field :unlock_token,    :type => String # Only if unlock strategy is :email or :both
  # field :locked_at,       :type => Time

  ## Token authenticatable
  field :authentication_token

  # Since we don't have username, so we will display uid in the url, just like twkunion.com/u/2012
  auto_increment :uid, seed: 2012

  attr_accessible :email,
                  :name,
                  :password,
                  :password_confirmation,
                  :remember_me,
                  :bio,
                  :skip_password

  attr_accessor :skip_password

  mount_uploader :avatar, UserAvatarUploader

  validates_confirmation_of :password

  validates :email, uniqueness: true, presence: true, format: { with: /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i }

  validates :name, presence: true

  has_many :activities, dependent: :destroy
  has_many :bbs_posts
  has_many :authentications, autosave: true, dependent: :destroy
  has_and_belongs_to_many :liked_topics, class_name: 'Topic', inverse_of: :fans

  def remember_me?
    true
  end

  def remember_me
    true
  end

  def like!(target)
    liked_topics.push(target) unless target.nil?
  end

  def unlike!(target)
    liked_topics.delete(target) unless target.nil?
  end

  # New user with session, by overriding devise method
  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session['omniauth']
        user.name ||= data.info.name
        user.skip_password = true
      end
    end
  end

  def apply_omniauth(omniauth)
    self.name = omniauth.info.name if omniauth.info.name && self.name.blank?

    self.authentications.build(
      provider:     omniauth.provider,
      uid:          omniauth.uid.to_s,
      access_token: omniauth.credentials.token
    )
  end

  def update_with_password(params={})
    current_password = params.delete(:current_password) if !params[:current_password].blank?

    if params[:password].blank?
      params.delete(:password)
      params.delete(:password_confirmation) if params[:password_confirmation].blank?
    end

    result = if has_no_password?  || valid_password?(current_password)
      update_attributes(params) 
    else
      self.errors.add(:current_password, current_password.blank? ? :blank : :invalid)
      self.attributes = params
      false
    end

    clean_up_passwords
    result
  end

  def has_no_password?
    self.encrypted_password.blank?
  end

  def remember_value
    self.remember_token ||= Devise.friendly_token
  end

  def password_required?
    skip_password.nil?
  end

  def email_nomarlisation
    self.email = email.strip.downcase
  end

  %w(admin user).each do |method|
    define_method("mark_as_#{method}!") {
      update_attribute(:is_admin, method == 'admin' ? true : false)
    }
  end
end
