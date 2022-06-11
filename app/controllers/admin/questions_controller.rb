class Admin::QuestionsController < ApplicationController
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

  private
  def question_params
    params.require(:question).permit(:body,:image)
  end
end
