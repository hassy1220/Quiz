class Admin::ChoicesController < ApplicationController
  def new
    @quiz = Quiz.find(params[:quiz_id])
    @question = Question.find(params[:question_id])
    @form = Form::ChoiceCollection.new
    @questions = @question.choices
  end

  def show
    @question = Question.find(params[:question_id])
    @quiz = Quiz.find(params[:quiz_id])
    choices = params[:id]
    choices = choices.split("/")
    @first_choice = Choice.find(choices[0].to_i)
    @second_choice = Choice.find(choices[1].to_i)
    @third_choice = Choice.find(choices[2].to_i)
    @vest_answer = VestAnswer.new
  end

  def create
    final_answer = params[:form_choice_collection][:answer]
    @quiz = Quiz.find(params[:quiz_id])
    @question = Question.find(params[:question_id])
    @form = Form::ChoiceCollection.new(choice_collection_params,final_answer)
    if @form.save
      redirect_to admin_quiz_question_choice_path(@quiz.id,@question.id,@question.choices.ids)
    else
      flash.now[:danger] = "解答は３件全て記入してください(正解は一つのみ(チェックは一つ))"
      render :new
    end
  end

  def edit
    @question = Question.find(params[:question_id])
    @quiz = Quiz.find(params[:quiz_id])
    @choice = Choice.find(params[:id])
  end

  def update
    @question = Question.find(params[:question_id])
    @quiz = Quiz.find(params[:quiz_id])
    choice = Choice.find(params[:id])
    choice.update(choice_params)
    redirect_to admin_quiz_question_choice_path(@quiz.id,@question.id,@question.choices.ids)
  end

  private

  def choice_collection_params
    params.require(:form_choice_collection).permit(choices_attributes: [:body,:question_id])
  end

  def choice_params
    params.require(:choice).permit(:body,:answer)
  end

end
