module Admin
  class ActionQuotesController < Manticore::ApplicationController
  
    def index
      @action_quotes = ActionQuote.all
    end
    
    def new
      @action_quote = ActionQuote.new
    end
    
    def create
      @action_quote = ActionQuote.new(params[:action_quote])
      if @action_quote.save
        redirect_to admin_action_quotes_path, :notice => "Action quote successfully created."
      else
        render :action => 'new'
      end
    end

    def edit
      @action_quote = ActionQuote.find(params[:id])
    end
    
    def update
      @action_quote = ActionQuote.find(params[:id])
      if @action_quote.update_attributes(params[:action_quote])
        redirect_to admin_action_quotes_path, :notice => "Action quote successfully updated."
      else
        render :action => 'edit'
      end
    end
    
    def destroy
      @action_quote = ActionQuote.find(params[:id])
      @action_quote.destroy
      redirect_to admin_action_quotes_path, :notice => "Action quote destroyed."
    end
    
  end
end
