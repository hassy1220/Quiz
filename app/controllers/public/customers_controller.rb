class Public::CustomersController < ApplicationController
  def show
    @customer = current_customer
    @answers = @customer.answers.where(quiz_id: params[:key].to_i).order("created_at DESC")
    @chart_answer = @answers.map{|answer|answer.score}

  end
  def index
    @customer = current_customer
    @answers = @customer.answers
    @only_answer = []
    Quiz.order("created_at DESC").each do |quiz|
      @only_answer << quiz.answers.order("created_at DESC").where(customer_id: @customer.id).first
    end
    @only_answer.delete(nil)
  end
end
