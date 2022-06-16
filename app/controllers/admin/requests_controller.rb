class Admin::RequestsController < ApplicationController
  def index
    @request = Request.all
  end
end
