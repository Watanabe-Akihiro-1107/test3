class BooksController < ApplicationController


    def index
    @book = Book.new
    @books = Book.all
  end

  def show
    @book = Book.new
    @books = Book.find(params[:id])
    @user = @books.user
    #@books =Book.all
  end

  def new
    @book = Book.new
    
  end

  def edit
    @book = Book.find(params[:id])
    unless @book.user == current_user
      redirect_to books_path
      
    end
  end

  def top
  end

  def about
  end


  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
    redirect_to book_path(@book.id), notice: "Book was successfully created."
    else
    @books = Book.all
    render :index
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
    redirect_to book_path(@book.id), notice: "Book was successfully updated."
    else
    @books = Book.all
    render :index
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private

    def book_params
      params.require(:book).permit(:title, :body )
    end
   end
