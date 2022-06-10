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
    @quiz = Quiz.find(params[:quiz_id])
    @question = Question.find(params[:question_id])
    @form = Form::ChoiceCollection.new(choice_collection_params)
    if @form.save
      # debugger
      # vest_answer = VestAnswer.new(vest_answer_params)
      # vest_answer.question_id = @question.id
      if vest_answer.save
        debugger
        redirect_to root_path
      end
    else
      render action: :new
      # debugger
      # session[:choices] = @form.attributes.slice(*choice_collection_params.keys) # *2 フォームで渡された値のみ保存
      # redirect_to new_admin_quiz_question_choice_path(@quiz.id,@question.id)
      # debugger
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
    params.require(:form_choice_collection).permit(choices_attributes: [:body,:answer,:question_id])
  end

  # def vest_answer_params
  #   params.require(:form_choice_collection).permit(vest_answer: [:description])
  # end

  def choice_params
    params.require(:choice).permit(:body,:answer)
  end

end
