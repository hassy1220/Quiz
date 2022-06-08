class Public::CustomersController < ApplicationController
  def show
    @customer = current_customer
    @answers = @customer.answers
  end
end
