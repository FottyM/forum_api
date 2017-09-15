class User < ApplicationRecord
  has_secure_password

  validates_uniqueness_of :email
  validates :username, :email, presence: true
  has_many :questions, dependent: :destroy
  has_many :answers, dependent: :destroy

end
