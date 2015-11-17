class UsersController < ApplicationController

    def show
      @book = Book.new
      @user = User.find(params[:id])
      @books = @user.books
    end

    def edit
      @user = User.find(params[:id])
    end

    def update
      @user = User.find(params[:id])
      @user.update(user_params)
      redirect_to user_path(@user)
    end

    def user_params
        params.require(:user).permit(:username, :profile_photo_url, :about)
    end
end
