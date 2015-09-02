class PricesController < ApplicationController

  # GET /prices
  def index
    @prices = Price.all
  end

  # GET /prices/1
  def show
    @price = Price.find(params[:id])
  end
end

