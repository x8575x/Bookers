class BooksController < ApplicationController

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to book_path(@book.id)
    else
      render :index
    end
    flash[:notice] = "Book was successfully created."
  end

  def index
    @book = Book.new
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    book.update
    redirect_to book
    flash[:notice] = "Book was successfully updated."

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
