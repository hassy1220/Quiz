class Public::RequestsController < ApplicationController
  before_action :move_to_signed_in
  def new
    @application = Request.new(session[:application] || {})
    @applications = Request.all
  end

  def show
    @post_request = Request.find(params[:id])
  end

  def create
    @application = Request.new(request_params)
    @application.customer_id = current_customer.id
    if @application.save
     session[:application] = nil
     redirect_to request.referer
    else
     session[:application] = @application.attributes.slice(*request_params.keys)
     flash[:danger] = @application.errors.full_messages
     redirect_to new_public_request_path
    end
  end

  private
  def request_params
    params.require(:request).permit(:title,:content)
  end
  def move_to_signed_in
    unless customer_signed_in?
      # サインインしていないユーザーはログインページが表示される
      redirect_to new_customer_session_path, notice: 'ログインしてください！'
    end
  end
end
