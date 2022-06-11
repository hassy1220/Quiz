class Public::AnswersController < ApplicationController
  def new
  end

  # def index
  #   @customer = current_customer
  #   @answers = @customer.answers
  #   @only_answer = []
  #   Quiz.order("created_at DESC").each do |quiz|
  #     @only_answer << quiz.answers.order("created_at DESC").where(customer_id: @customer.id).first
  #   end
  #   @only_answer.shift
  # end

  # def show
  #   @customer = current_customer
  #   @answers = @customer.answers
  # end

  def create
    answer = params[:answer]
    quiz = Quiz.find(params[:quiz_id])
    split_answer = answer.split("|")
    split_answer.shift
    @question_count = 0
    @true_count = 0
    split_answer.each do |answer|
      json_answer = JSON.parse(answer)
      question = quiz.questions.find_by(id: json_answer["question_id"])
      choice = question.choices.find_by(answer: true)
      if choice == question.choices.find_by(id: json_answer["answer_id"])
        @true_count += 1
      end
      @question_count += 1
    end
    @score = @true_count.to_f / @question_count * 100

    # if current_customer.answers.exists?(quiz_id: quiz.id)
    #   Answer.find(quiz.id).update(score: @score)
    #   redirect_to public_quiz_result_path(quiz.id)
    # else
      Answer.create(customer_id: current_customer.id,score: @score,quiz_id: quiz.id)
      redirect_to public_quiz_result_path(quiz.id)
    # end
  end

  def result
    @quiz = Quiz.find(params[:quiz_id])
    @result = Answer.where(quiz_id: @quiz).last
  end

  private
  def answer_params

  end


end