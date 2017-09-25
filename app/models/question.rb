class Question < ApplicationRecord
  validates_presence_of :title, :body
  validates_length_of :title,  in: 3..60
  validates_length_of :body, in: 3..1000
  before_save :capitalize_title

  belongs_to :user
  has_many :answers, dependent: :destroy

  def capitalize_title
    self.title.capitalize!
  end

end
