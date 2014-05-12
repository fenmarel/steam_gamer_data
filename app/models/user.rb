class User < ActiveRecord::Base
  validates :username, :email, :uniqueness => true
  validates :username, :email, :presence => true

  def self.find_by_credentials(login)
    user = User.find_by_username(login[:username])

    user && user.is_password?(login[:password]) ? user : nil
  end

  def self.generate_token
    SecureRandom::base64(32)
  end

  def is_password?(raw)
    BCrypt::Password.new(self.password_digest).is_password?(raw)
  end

  def password=(raw)
    self.password_digest = BCrypt::Password.create(raw)
  end

  def reset_session_token!
    self.session_token = self.class.generate_token
    self.save!

    self.session_token
  end


end
