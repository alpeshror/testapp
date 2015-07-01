class ApiController < ApplicationController

  skip_before_filter :verify_authenticity_token

  def show
    @snippet = Snippet.find(params[:id])
  end
  
  def create
    snippet_params
    @snippet = Snippet.new(text: params[:text], private: params[:private])
    unless @snippet.save
      head :bad_request and return
    end
  end

  private

  def snippet_params
    params.permit(:text, :private)
  end
  

end
