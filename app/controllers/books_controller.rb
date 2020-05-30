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
        # @purchase = Purchase.new
        # @purchase.book_id = @book.id
        # @purchase.user_id = current_user.id
        # we don't need to save @purchase 
    end

    def index
        if !params[:user_id]
            @books = Book.all 
        else
            user = User.find_by(id: params[:user_id])
            @books = user.books
        end
    end

    def edit
        @book = Book.find_by(id: params[:id])
    end

    def update
        @book = Book.find_by(id: params[:id])
        if @book
            @book.update(book_params)
            redirect_to book_path(@book)
        else
            render :edit 
        end
    end

    private 

    def book_params 
        params.require(:book).permit(:title, :genre_id, :description, :number_of_pages, :author, :for_sale, :price)
    end

end
