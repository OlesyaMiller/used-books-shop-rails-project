class BooksController < ApplicationController
    before_action :require_login

    def new
        @book = Book.new
        @book.build_genre  
    end

    def create
        @book = Book.new(book_params)
        if @book.save && @book.valid?
            redirect_to book_path(@book)
        else
            render :new
        end
    end

    def show
        @book = Book.find_by(id: params[:id])
    end

    def index
        if !params[:user_id]
            if (params[:book] && params[:book][:search].blank?) || !params[:book]
                @books = Book.all.order(:title) 
            else
                @books = Book.where(genre_id: params[:book][:search])
            end
        else
            @user = User.find_by(id: params[:user_id])
            if @user 
                @books = @user.books
            end
        end
    end

    def edit
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
        params.require(:book).permit(
            :title, 
            :genre_id, 
            :description, 
            :number_of_pages, 
            :author, 
            :price, 
            genre_attributes: [:name]
            )
    end

    def find_book
        @book = Book.find_by(id: params[:id])
    end
end
