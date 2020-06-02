class BooksController < ApplicationController

    def new
        if params[:user_id]
            @book = Book.new 
            @user = User.find_by(id: params[:user_id])
            @book.users << @user 
            @book.build_genre 
        else
            @book = Book.new
            @book.build_genre  
        end
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
            if user 
                @books = user.books
            end
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
        params.require(:book).permit(:title, :genre_id, :description, :number_of_pages, :author, :for_sale, :price, user_ids:[], genre_attributes: [:name] )
    end

end
