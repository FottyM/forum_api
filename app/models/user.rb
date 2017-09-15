class User < ApplicationRecord
  has_secure_password

  validates_uniqueness_of :email
  validates :username, :email, presence: true

end
