class SessionController < ApplicationController

    def new  
        @user = User.new 
    end

    def create
        if @user = User.find_by(username: params[:username]) 
            session[:user_id] = @user.id 
            redirect_to user_path(@user)
        else
            render :signin
        end
    end

    def omniauth
        @user = User.find_or_create_by(id: auth['id']) do |u|
            u.username = auth['info']['username']
            u.email = auth['info']['email']
        end
       
        session[:user_id] = @user.id
       
        render 'static/home'
    end

    def destroy
        session.delete("user_id") 
        redirect_to root_path
    end

    private
 
    def auth
        request.env['omniauth.auth']
    end

end