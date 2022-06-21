class Admin::VestAnswersController < ApplicationController
  before_action :move_to_signed_in

  def create
    @quiz = Quiz.find(params[:quiz_id])
    @question = Question.find(params[:question_id])
    answer = VestAnswer.new(vest_answer_params)
    answer.question_id = @question.id
    if answer.save
    else
      flash[:danger] = answer.errors.full_messages
      redirect_to admin_quiz_question_choice_path(@quiz.id,@question.id,@question.choices.ids)
    end
  end
  def edit
    @vest_answer = VestAnswer.find(params[:id])
    @quiz = Quiz.find(params[:quiz_id])
    @question = Question.find(params[:question_id])
  end
  def update
    @quiz = Quiz.find(params[:quiz_id])
    @question = Question.find(params[:question_id])
    @vest_answer = VestAnswer.find(params[:id])
    if @vest_answer.update(vest_answer_params)
      redirect_to admin_quiz_question_choice_path(@quiz.id,@question.id,@question.choices.ids)
    else
      flash[:danger] = @vest_answer.errors.full_messages
      redirect_to edit_admin_quiz_question_vest_answer_path(@quiz.id,@question.id,@question.vest_answer.id)
    end
  end

  private
  def vest_answer_params
    params.require(:vest_answer).permit(:description)
  end

  def move_to_signed_in
    unless admin_signed_in?
      # サインインしていないユーザーはログインページが表示される
      redirect_to new_admin_session_path, notice: '管理者としてログインしてください！'
    end
  end

end
