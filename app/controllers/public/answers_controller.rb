class Public::AnswersController < ApplicationController

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

    Answer.create(customer_id: current_customer.id,score: @score,quiz_id: quiz.id)
    if current_customer.answers.where(quiz_id: quiz.id).count > 4
      current_customer.answers.where(quiz_id: quiz.id).first.destroy
    end

    redirect_to public_quiz_result_path(quiz.id)
  end

  def result
    @quiz = Quiz.find(params[:quiz_id])
    @result = Answer.where(quiz_id: @quiz).last
  end

  private
  def answer_params

  end


end
