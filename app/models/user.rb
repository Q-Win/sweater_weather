class User < ApplicationRecord
  validates :email, uniqueness: true, presence: true
  has_secure_password

  def generate_api_key
    self.update(api_key: SecureRandom.urlsafe_base64)
    self.api_key
  end

end
