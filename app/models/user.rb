class User < ApplicationRecord
  has_secure_password
  validates_uniqueness_of :email
  validates_presence_of :username, :email
  validates_format_of  :email, with: /\A[\+A-Z0-9\._%-]+@([A-Z0-9-]+\.)+[A-Z]{2,4}\z/i
  has_many :questions, dependent: :destroy
  has_many :answers, dependent: :delete_all
  before_save :downcase_email

  def downcase_email
    self.email.downcase!
  end

end
