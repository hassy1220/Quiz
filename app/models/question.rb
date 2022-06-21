class Question < ApplicationRecord
  belongs_to:quiz
  has_many:choices,dependent: :destroy
  has_one_attached :image
  has_one :vest_answer

  validates :body, presence: :true

end
