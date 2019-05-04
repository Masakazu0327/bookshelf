# app/controllers/books_controller.rb

class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end 
  def create
    @book = Book.new(book_params)
    if @book.save
        redirect_to @book, notice: "書籍を登録しました。"
    else
        render :new
    end
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
      redirect_to @book, notice: "書籍を更新しました。"
    else
      render :edit
    end
  end

  private 
  def book_params
    params.require(:book).permit(:title, :price, :publish_date, :description, :new_image)
  end
end