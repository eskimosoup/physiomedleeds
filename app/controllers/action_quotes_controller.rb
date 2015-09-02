class ActionQuotesController < ApplicationController

  # GET /action_quotes
  def index
    @action_quotes = ActionQuote.where(display: true)
  end

  # GET /action_quotes/1
  def show
    @action_quote = ActionQuote.find(params[:id])
  end
end

