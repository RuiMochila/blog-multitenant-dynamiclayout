class BlogsController < ApplicationController
  def index
    @blogs = Blog.all
  end

  def show
    @blog = Blog.find_by_subdomain!(request.subdomain)
  end

  def new
    @blog = Blog.new
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def create
    @blog = Blog.new(params[:blog])
    if @blog.save
      redirect_to root_url(subdomain: @blog.subdomain), notice: "Successfully created blog."
    else
      render :new
    end
  end

  def update
    @blog = Blog.find(params[:id])
    if @blog.update_attributes(params[:blog])
      redirect_to root_url(subdomain: @blog.subdomain), notice: "Successfully updated blog."
    else
      render :edit
    end
  end

  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy
    redirect_to root_url, notice: "Successfully destroyed article."
  end
end
