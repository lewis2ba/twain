class UsersController < ApplicationController
  #before_action :set_user, only: [:show, :edit]

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
# add a `private` section here for the strong params below
    def user_params
        params.require(:user).permit(:username, :profile_photo_url, :about)
    end

    # def set_user
      # @user = User.find(params[:id])
    #end
end
