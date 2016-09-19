class User < ActiveRecord::Base
  validates :user_name, :password_digest, presence: true
  validates :password, length: { minimum: 8, allow_nill: true}
  # after_initialize :ensure_session_token

  has_many :cats
  has_many :rental_requests
  has_many :sessions

  def self.find_by_credentials(user_name, pass)
    user = User.find_by(user_name: user_name)
    return nil unless user
    user.is_password?(pass) ? user : nil
  end

  attr_reader :password

  def password=(pass)
    @password = pass
    self.password_digest = BCrypt::Password.create(pass)
  end

  def is_password?(pass)
    BCrypt::Password.new(self.password_digest).is_password?(pass)
  end

  def ensure_session_token
    self.session_token ||= SecureRandom.urlsafe_base64
  end

  def reset_session_token!
    self.session_token = SecureRandom.urlsafe_base64
    save
  end

  def create_session(ip_address)
    @session = Session.new(user_id: self.id, token: SecureRandom.urlsafe_base64, ip_address: ip_address)
    @session.save
    @session.token
  end
end
