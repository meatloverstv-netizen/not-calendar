class BlogsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @blogs = Blog.all
    @dairy =Dairy.all
  end

  def new
    @blog = Blog.new
  end

  def show
    @blog = Blog.find(params[:id])
  end

  def create
    Blog.create(blog_params)
    redirect_to blogs_path
  end

  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy
    redirect_to blogs_path, notice:"削除しました"
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def update
    @blog = Blog.find(params[:id])
    if @blog.update(blog_params)
      redirect_to blogs_path, notice: "編集しました"
    else
      render 'edit'
    end
  end

  def daily
    @date = params[:date].to_date
    @blogs = Blog.where(start_time: @date.all_day)
    @dairies = Dairy.where(date:@date)
  end
  
  private

  def blog_params
    params.require(:blog).permit(:title, :content, :start_time, :end_time)
  end

end

