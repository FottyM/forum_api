class Question < ApplicationRecord
  validates_presence_of :title, :body
  validates_length_of :title,  in: 3..60
  #TODO: Is this length necessary?
  # validates_length_of :body, in: 3..255

  belongs_to :user
  has_many :answers, dependent: :destroy

end
