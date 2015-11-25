class TagsController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @book = Book.find(params[:book_id])
    @tag = Tag.new
  end
  # Generally, the only stuff you want to keep in your master branch is stuff that works
  # Features that are in-development should be moved to another branch
  def create
    @user = User.find(params[:user_id])
    @book = Book.find(params[:book_id])

    if (Tag.find_by(tag_params))
      exists = Tag.find_by(tag_params)
      @tagging = Tagging.create(book_id: @book.id,tag_id: exists.id)

    else

      doesnt = Tag.create(tag_params)
      @tagging = Tagging.create(book_id: @book.id, tag_id: doesnt.id)

    end

  redirect_to user_path(@user)
  end


  private
  def tag_params
    params.require(:tag).permit(:name)
  end
end
