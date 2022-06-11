class Admin::QuizzesController < ApplicationController
  def new
    @quiz = Quiz.new
    # (session[:quiz] || {})
    @quizs = Quiz.all
  end

  def create
    @quiz = Quiz.new(quiz_params)
    if @quiz.save
      redirect_to new_admin_quiz_path
    else
      # session[:quiz] = @quiz.attributes.slice(*quiz_params.keys)
      flash[:danger] = @quiz.errors.full_messages
      redirect_to new_admin_quiz_path
    end
  end

  private

  def quiz_params
    params.require(:quiz).permit(:name)
  end


end
