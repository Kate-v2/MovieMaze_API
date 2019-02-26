class User < ApplicationRecord
  validates_presence_of :email, :password
  validates :username, uniqueness: true, presence: true
  validates :token,    uniqueness: true, presence: true
  has_secure_password


  def self.make_user(data)
      base = {
        email:    data[:email],
        password: data[:password],
        username: data[:username]
      }
      user = User.new(base)
      # Should I handle this in the controller instead?
      return if     User.find_by_username(base[:username])
      return unless user.send(:confirm_password, data[:password_confirmation])
      user.send(:generate_api_key)
      return unless user.save!
      user
    end



  private


  def confirm_password(conf_pw)
    password == conf_pw
  end


  def generate_api_key
    api_key = self.token = SecureRandom.base64
    generate_api_key if User.find_by_token(api_key)
    api_key
  end


end
