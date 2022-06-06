class Admin::ChoicesController < ApplicationController
  def new
    @quiz = Quiz.find(params[:quiz_id])
    @question = Question.find(params[:question_id])
    @form = Form::ChoiceCollection.new
    @questions = @question.choices


  end

  def create
    @form = Form::ChoiceCollection.new(choice_collection_params)

    if @form.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def choice_collection_params
    params.require(:form_choice_collection).permit(choices_attributes: [:body,:answer,:question_id])
  end

end
