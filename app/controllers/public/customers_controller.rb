class Public::CustomersController < ApplicationController
  def show
    @customer = current_customer
    @answers = @customer.answers
    @only_answer = []
    Quiz.order("created_at DESC").each do |quiz|
      @only_answer << quiz.answers.order("created_at DESC").where(customer_id: @customer.id).first
    end
    @only_answer.delete(nil)
  end

  def detail
    @customer = current_customer
    @answers = @customer.answers.where(quiz_id: params[:key].to_i).order("created_at DESC")
    @chart_answer = @answers.map{|answer|answer.score}
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
      redirect_to public_customers_path
    else
      flash[:danger] = @customer.errors.full_messages
      redirect_to edit_public_customers_path
    end
  end

  def destroy
    customer = current_customer
    customer.destroy
    flash[:danger] = "退会処理完了しました"
    redirect_to root_path
  end

  private
  def customer_params
    params.require(:customer).permit(:name)
  end
end
