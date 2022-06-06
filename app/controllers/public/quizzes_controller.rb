class Public::QuizzesController < ApplicationController
  def index
    @quizs = Quiz.all
  end
end
