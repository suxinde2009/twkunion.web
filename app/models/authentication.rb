class Authentication
  include Mongoid::Document
  include Mongoid::Timestamps

  field :provider
  field :uid
  field :access_token

  belongs_to :user
  
  def self.create_from_hash(user, omniauth)
    self.create!(
      user_id:      user.id,
      provider:     omniauth.provider,
      uid:          omniauth.uid.to_s,
      access_token: omniauth.credentials.token
    )
  end
end