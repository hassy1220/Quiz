class Admin::VestAnswersController < ApplicationController
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
  end
  def update
  end

  private
  def vest_answer_params
    params.require(:vest_answer).permit(:description)
  end
end