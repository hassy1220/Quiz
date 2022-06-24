class Public::QuizzesController < ApplicationController

  def index
    quizs = Quiz.includes(:questions).where(status: true)
    # quizs = Quiz.where(status: true)
    @quizs = quizs.select {|item| item.questions.count > 1 }
  end

end
