
class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
     flash[:notice] = 'successfully'
     redirect_to book_path(@book.id)
    else
      flash[:notice] = "error"
      render :new
    end
  end

  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
     @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
     flash[:notice] = 'successfully'    
     redirect_to book_path(@book.id)
    else
     render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to book_path(book.id)
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
