class PagesController < ApplicationController

	def	index
		@pages = Page.all
	end

	def new
		@page = Page.new
	end

	def show
		@page = Page.find(params[:id])		
	end

	def create
		@page = Page.create(params[:page])
		redirect_to pages_url
	end

	def edit
		@page = Page.find(params[:id])
	end

	def update
		@page = Page.find(params[:id])
		@page.update_attributes(params[:page])
		render text: ""
	end	

	def destroy
		@page = Page.find(params[:id])
		@page.destroy
	end

	def mercury_update
	  page = Page.find(params[:id])
	  page.name = params[:content][:page_name][:value]
	  page.content = params[:content][:page_content][:value]
	  page.save!
	  render text: ""
	end

end