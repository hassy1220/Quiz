class Public::AnswersController < ApplicationController
  def new
    # @quiz = Quiz.find(params[:quiz_id])
    # @question = @quiz.questions.first
  end

  def create
    # @quiz = Quiz.find(params[:quiz_id])
    # @quiz.questions.next(@quiz.id)

  end
  # def next(quiz)
  #   quiz.questions.where("id > ?", self.id).order("id ASC").first
  # end
end
