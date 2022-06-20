class Public::QuestionsController < ApplicationController
  before_action :move_to_signed_in
  def show
    answer = params[:answer]
    @quiz = Quiz.find(params[:quiz_id])
    @question = Question.find(params[:id])
    if @quiz.questions.last.id == @question.id
      respond_to do |format|
        format.js {render 'public/questions/answer.js.erb'}
      end
      return
    end
    if @quiz.questions.first.id == @question.id
      @answer1 = @question.choices.first
      @answer2 = @question.choices.second
      @answer3 = @question.choices.third
    end
    if params[:step] == "next"
      @question = @quiz.questions.where("id > ?", @question.id).order("id ASC").first
      @answer1 = @question.choices.first
      @answer2 = @question.choices.second
      @answer3 = @question.choices.third
    else
    #   redirect_to
    end
  end


  private
  def move_to_signed_in
    unless customer_signed_in?
      # サインインしていないユーザーはログインページが表示される
      redirect_to new_customer_session_path, notice: 'ログインしてください！'
    end
  end

end
