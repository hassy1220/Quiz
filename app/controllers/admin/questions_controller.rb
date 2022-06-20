class Admin::QuestionsController < ApplicationController
  before_action :move_to_signed_in
  # before_action :if_not_admin
  def new
     @quiz = Quiz.find(params[:quiz_id])
     @question = Question.new
     @questions = @quiz.questions
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

  def edit
    @quiz = Quiz.find(params[:quiz_id])
    @question = Question.find(params[:id])
  end

  def update
    @quiz = Quiz.find(params[:quiz_id])
    @question = Question.find(params[:id])
    if @question.update(question_params)
      flash[:danger] = "解答選択肢も変更が必要な場合は変更してください"
      redirect_to admin_quiz_question_choice_path(@quiz.id,@question.id,@question.choices.ids)
    else
      flash[:danger] = @question.errors.full_messages
      redirect_to edit_admin_quiz_question_path(@quiz.id,@question.id)
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

end
