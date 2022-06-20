class Public::QuizzesController < ApplicationController

  def index
    quizs = Quiz.all
    @quizs = quizs.select {|item| item.questions.count > 1 }
  end

end
