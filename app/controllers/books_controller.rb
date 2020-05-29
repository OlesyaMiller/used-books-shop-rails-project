class BooksController < ApplicationController

    def new
        @book = Book.new
    end

    def create
        @book = Book.new(book_params)
        if @book.save && logged_in?
            redirect_to book_path(@book)
        else
            render :new
        end
    end

    def show
        @book = Book.find_by(id: params[:id])
        @purchase = @book.purchases.build(user_id: current_user.id)
    end

    def index
        @books = Book.all 
    end

    private 

    def book_params 
        params.require(:book).permit(:title, :genre_id, :description, :number_of_pages, :author, :for_sale, :price)
    end

end
