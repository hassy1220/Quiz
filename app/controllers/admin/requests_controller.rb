class Admin::RequestsController < ApplicationController
  def index
    @post_request = Request.all
  end
  def show
    @post_request = Request.find(params[:id])
  end

  def update
    post_request = Request.find(params[:id])
    post_request.update(post_request_params)
    redirect_to request.referer
  end

  private
  def post_request_params
    params.require(:request).permit(:status)
  end
end
