class Admin::QuizzesController < ApplicationController
  # before_action :move_to_signed_in, except: [:index]
  # before_action :if_not_admin
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

  # def move_to_signed_in
  #   unless customer_signed_in?
  #     # サインインしていないユーザーはログインページが表示される
  #     redirect_to new_customer_session_path, notice: 'ログインしてください！'
  #   end
  # end
  # private
  # def if_not_admin
  #   redirect_to root_path unless current_user.admin?
  # end

end
