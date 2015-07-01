class SnippetsController < ApplicationController

  def index
    @snippets = Snippet.public_snippet.limit(20)
  end

  def new
    @snippet = Snippet.new
  end

  def show
    @snippet = Snippet.find(params[:id])
  end
  
  def private_snippet
    @snippet = Snippet.where(access_token: params[:access_token]).first
    render 'show'
  end

  def create
    @snippet = Snippet.new(snippet_params)
    if @snippet.save
      redirect_to @snippet
    else
      render 'new'
    end
  end

  private

  def snippet_params
    params.require(:snippet).permit(:text, :private)
  end

end
