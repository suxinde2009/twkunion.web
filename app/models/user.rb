class User
  include Mongoid::Document
  include Mongoid::Timestamps
  
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
  field :username
  field :name
  field :avatar
  field :bio
  field :is_admin, type: Boolean, default: false

  ## Recoverable
  field :reset_password_token
  field :reset_password_sent_at, type: Time

  ## Rememberable
  field :remember_created_at, type: Time

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

  attr_accessible :email, :name, :username, :password, :password_confirmation, :remember_me

  mount_uploader :avatar, UserAvatarUploader

  validates_confirmation_of :password
  

  validates :email, presence: true, format: { with: /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i }

  validates :username, presence: true, uniqueness: true

  validates :name, presence: true

  has_many :activities, dependent: :destroy
  has_many :bbs_posts
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

  %w(admin user).each do |method|
    define_method("mark_as_#{method}!") {
      update_attribute(:is_admin, method == 'admin' ? true : false)
    }
  end
end
