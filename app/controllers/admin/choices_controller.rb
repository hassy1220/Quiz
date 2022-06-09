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
  end

  def create
    @form = Form::ChoiceCollection.new(choice_collection_params)
    if @form.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @question = Question.find(params[:question_id])
    @quiz = Quiz.find(params[:quiz_id])
    @choice = Choice.find(params[:id])
  end

  def update
    
  end

  private

  def choice_collection_params
    params.require(:form_choice_collection).permit(choices_attributes: [:body,:answer,:question_id])
  end

end
