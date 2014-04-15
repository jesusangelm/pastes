class SnippetsController < ApplicationController

  def index
    @snippets = Snippet.all
  end

  def new
    @snippet = Snippet.new
  end

  def create
    @snippet = Snippet.new(snippet_params)

    if @snippet.save
      redirect_to @snippet, notice: "Snippet creado!"
    else 
      render :new
    end
  end

  def show
    @snippet = Snippet.find(params[:id])
  end

  def destroy
    @snippet = Snippet.find(params[:id])
    @snippet.destroy

    redirect_to root_path, notice: "Snippet eliminado!"
  end

  private

  def snippet_params
    params.require(:snippet).permit(:title, :lang, :code)
  end
end
