class ArticlesController < ApplicationController
  # Para carregar o blog currente em função do subdomain para usar
  # before_filter :load_blog, :only => :show
  
  def show
  	# Antes ia pelo blog carregado
    # @article = @current_blog.articles.find(params[:id])

    #Agora é automático pelo scope, no model pelo current blog id
	@article = Article.find(params[:id])
  end

  #creates e assim tb.
  
end
