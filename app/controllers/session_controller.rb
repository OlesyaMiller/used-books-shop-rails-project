class SessionController < ApplicationController

    def new  
    end

    def create
        @user = User.find_by(username: params[:username]) 
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id 
            redirect_to user_path(@user)
        else
            render :signin
        end
    end

    def omniauth
        @user = User.find_or_create_by(email: auth['info']['email']) do |u|
            u.username = auth['info']['name']
            u.email = auth['info']['email']
            u.password = "password"
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