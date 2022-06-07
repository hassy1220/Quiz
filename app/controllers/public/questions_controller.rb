class Public::QuestionsController < ApplicationController
  def show
    answer = params[:answer]
    @quiz = Quiz.find(params[:quiz_id])
    @question = Question.find(params[:id])
    @answer1 = @question.choices.first
    @answer2 = @question.choices.second
    @answer3 = @question.choices.third
     if params[:step] == "next"
       @question = @quiz.questions.where("id > ?", @question.id).order("id ASC").first
       @answer1 = @question.choices.first
       @answer2 = @question.choices.second
       @answer3 = @question.choices.third
     else
    #     respond_to do |format|
    #     format.js { render ajax_redirect_to(public_park_path(@park.id)) }
    #   end
     end
  end

  def create
  end
end
