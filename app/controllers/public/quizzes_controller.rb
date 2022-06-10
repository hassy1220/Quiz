class Public::QuizzesController < ApplicationController
  def index
    quizs = Quiz.all
    @quizs = quizs.select {|item| item.questions.count >= 1 }
  end
  def show
    # @quiz = Quiz.find(params[:id])
    # @question = @quiz.questions.first
  end
  def create
    # @question = Question.find(params[:question_id])
    # debugger
  end
end
