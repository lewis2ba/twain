class BooksController < ApplicationController

  def index
    @tags = Tag.all
      if params[:tags]
        @tag = Tag.find_by(name: params[:tags])
        @books = @tag.books.uniq
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
    @book = current_user.books.create!(book_params)
    redirect_to user_path(current_user)
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to user_path(current_user)
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to user_path(current_user)
  end

# add `private` here for strong params
  def book_params
      params.require(:book).permit(:title, :author, :genre, :image_url, :no_pages, :synopsis, :condition)
  end
end
