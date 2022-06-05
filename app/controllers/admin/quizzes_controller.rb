class Admin::QuizzesController < ApplicationController
  def new
    @quiz = Quiz.new
  end

  def create
    
  end

  private
  def quiz_params
    params.require(:quiz).permit(:name)
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def choice_params
    params.require(:choice).permit(:body,:answer)
  end

end
