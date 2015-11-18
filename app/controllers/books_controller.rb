class BooksController < ApplicationController

  def index
    @tags = Tag.all
      if params[:tags]
        @tag = Tag.find_by(name: params[:tags])
        @books = Tag.find_by(name: params[:tags]).books.uniq
      else
        @books = Book.all
      end
  end

  def show
    @book = Book.find(params[:id])
    @user = User.find(params[:user_id])
  end

  def new
    @book = Book.new
  end

  def create
    @user = current_user
    @book = @user.books.create!(book_params)
    redirect_to user_path(@user)
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @user = current_user
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to user_path(current_user)
  end

  def destroy
    @user = current_user
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to user_path(current_user)
  end

  def book_params
      params.require(:book).permit(:title, :author, :genre, :image_url, :no_pages, :synopsis, :condition)
  end
end
