class Public::QuizzesController < ApplicationController

  def index
    @quizs = Quiz.includes(:questions).where(status: true).page(params[:page]).per(7)
  end

end
