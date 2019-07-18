class HomeController < ApplicationController
  def index
  end

  def search
    data = Procedure.search(params[:query])
    render json: { data: data, query: params[:query] }
  end
end
