class DairiesController < ApplicationController
    before_action :authenticate_user!

    def new
        @dairy = Dairy.new
    end

    def create
        Dairy.create(dairy_params)
        redirect_to blogs_path, notice: "日記を書きました"
    end

    def edit
     @dairy = Dairy.find(params[:id])
    end

    def show
        @dairy = Dairy.find(params[:id])
    end

    def destroy
     @dairy = Dairy.find(params[:id])
     @dairy.destroy
     redirect_to blogs_path, notice:"削除しました"
    end

    def update
     @dairy = Dairy.find(params[:id])
     if @dairy.update(dairy_params)
      redirect_to blogs_path, notice: "編集しました"
     else
      render 'edit'
     end
    end

    private

    def dairy_params
      params.require(:dairy).permit(:title, :content, :date, :image)
    end
end
