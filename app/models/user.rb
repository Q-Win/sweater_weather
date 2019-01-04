class User < ApplicationRecord
  validates :email, uniqueness: true, presence: true

  def generate_api_key
    self.api_key = SecureRandom.urlsafe_base64
  end

end
