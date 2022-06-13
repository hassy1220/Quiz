class Admin::QuestionsController < ApplicationController
  before_action :move_to_signed_in
  # before_action :if_not_admin
  def new
     @quiz = Quiz.find(params[:quiz_id])
     @question = Question.new
     @questions = @quiz.questions
    # @questions = @quiz.includes(:questions).all

     @public_quiz = []
     @private_quiz = []
     @quiz.questions.each do |question|
       if question.choices.exists?
         @public_quiz.push(question)
       else
         @private_quiz.push(question)
       end
     end
  end

  def create
    @quiz = Quiz.find(params[:quiz_id])
    question = Question.new(question_params)
    question.quiz_id = @quiz.id
    if question.save
      redirect_to new_admin_quiz_question_path
    else
      flash[:danger] = question.errors.full_messages
      redirect_to new_admin_quiz_question_path(@quiz.id)
    end
  end

  private
  def question_params
    params.require(:question).permit(:body,:image)
  end

  def move_to_signed_in
    unless admin_signed_in?
      # サインインしていないユーザーはログインページが表示される
      redirect_to new_admin_session_path, notice: '管理者としてログインしてください！'
    end
  end

  # private
  # def if_not_admin
  #   redirect_to root_path unless current_user.admin?
  # end
end
