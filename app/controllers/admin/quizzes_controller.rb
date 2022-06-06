class Admin::QuizzesController < ApplicationController
  def new
    @quiz = Quiz.new
    @quizs = Quiz.all
  end

  def create
    quiz = Quiz.new(quiz_params)
    quiz.save
    redirect_to new_admin_quiz_path
  end

  private
  # def choice_collection_params
  #   params.require(:form_choice_collection).permit(memos_attributes: :body)
  # end

  def quiz_params
    params.require(:quiz).permit(:name)
  end

  

  # def choice_params
  #   params.require(:choice).permit(:body,:answer)
  # end

end
