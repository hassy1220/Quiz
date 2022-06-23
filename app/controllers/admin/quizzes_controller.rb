class Admin::QuizzesController < ApplicationController
  before_action :move_to_signed_in

  def new
    @quiz = Quiz.new
    @private_quizs = Quiz.where(status: false)
    @public_quizs = Quiz.where(status: true)
  end

  def create
    @quiz = Quiz.new(quiz_params)
    if @quiz.save
      redirect_to new_admin_quiz_path
    else
      flash[:danger] = @quiz.errors.full_messages
      redirect_to new_admin_quiz_path
    end
  end

  def destroy
    quiz = Quiz.find(params[:id])
    quiz.destroy
    redirect_to new_admin_quiz_path
  end

  def edit
    @quiz = Quiz.find(params[:id])
  end

  def update
    @quiz = Quiz.find(params[:id])
    if @quiz.questions.select{|n| n.choices != []}.count >= 10
      if @quiz.update(quiz_params)
        redirect_to new_admin_quiz_question_path(@quiz.id)
      else
        flash[:danger] = @quiz.errors.full_messages
        redirect_to edit_admin_quiz_path(@quiz.id)
      end
    else
      if @quiz.update(name: params[:quiz][:name])
        flash[:danger] = "※公開するには問題を１０個作成してください"
        redirect_to new_admin_quiz_question_path(@quiz.id)
      else
        flash[:danger] = @quiz.errors.full_messages
        redirect_to edit_admin_quiz_path(@quiz.id)
      end
    end
  end

  private

  def quiz_params
    params.require(:quiz).permit(:name,:status)
  end

  def move_to_signed_in
    unless admin_signed_in?
      # サインインしていないユーザーはログインページが表示される
      redirect_to new_admin_session_path, notice: '管理者としてログインしてください！'
    end
  end
end
