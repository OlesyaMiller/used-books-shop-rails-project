class BooksController < ApplicationController
    before_action :require_login

    def new
        @book = Book.new
        @book.build_genre  
    end

    def create
        @book = Book.new(book_params)
        if @book.save && logged_in? && @book.valid?
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
            @books = Book.search(params[:search]) 
        else
            @user = User.find_by(id: params[:user_id])
            if @user 
                @books = @user.books
            end
        end
    end

    def edit
        #make sure the book belongs to the current user 
        @book = Book.find_by(id: params[:id])
    end

    def update
        find_book
        if @book
            @book.update(book_params)
            redirect_to book_path(@book)
        else
            render :edit 
        end
    end

    def destroy
        find_book
        @book.delete
        redirect_to books_path
    end

    private 

    def book_params 
        params.require(:book).permit(:title, :genre_id, :description, :number_of_pages, :author, :price, genre_attributes: [:name] )
    end

    def find_book
        @book = Book.find_by(id: params[:id])
    end
end
