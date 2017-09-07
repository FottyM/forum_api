class Question < ApplicationRecord
  validates_presence_of :title, :body
  validates_length_of :title,  in: 3..60
  validates_length_of :body, in: 3..255

end
