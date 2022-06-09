class Question < ApplicationRecord
  belongs_to:quiz
  has_many:choices,dependent: :destroy

  # def next(quiz)
  #   quiz.questions.where("id > ?", self.id).order("id ASC").first
  # end
  has_one_attached :image
end
