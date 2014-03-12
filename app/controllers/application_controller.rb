class ApplicationController < ActionController::Base
  protect_from_forgery
  around_filter :scope_current_blog
  layout :set_layout

	# def load_blog
	# 	@current_blog = Blog.find_by_subdomain(request.subdomain)
 #  		if @current_blog.nil?
 #    		flash[:error] = "Blog invalid"
 #    		redirect_to root_url
 #  		end
	# end

	def set_layout
    # Antes com a instância a ser loaded
  	# (@current_blog && @current_blog.layout_name) || 'application'

    (current_blog && current_blog.layout_name) || 'application'
	end
  # Alternativa ao bloco layout :set_layout
  # self.class.layout(@current_blog.layout_name || 'application')
 

private

  def current_blog
    Blog.find_by_subdomain request.subdomain
  end
  helper_method :current_blog

  def scope_current_blog
    Blog.current_id = current_blog && current_blog.id
    yield
    ensure
      Blog.current_id = nil
  end

end
