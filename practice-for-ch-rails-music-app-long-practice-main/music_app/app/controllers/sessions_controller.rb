class SessionsController < ApplicationController
    before_action :require_logged_in, only: [:destroy]
    before_action :require_logged_out, only: [:new, :create]

    def new
        @user = User.new
        render :new
    end
    def create
        email = params[:user][:email]
        password = params[:user][:password]

        @user = User.find_by_credentials(email, password)

        if @user
            login!(@user)
            redirect_to user_url(@user) # find out if this is redirecting to UsersController#show
        else
            @user = User.new(email: email)
            flash.now[:errors] = ["Incorrect email and/or password"]
            render :new
        end
    end
    
    def destroy
        if logged_in!
            logout!
        end

        flash[:messages] = ["Successfully logged out!"]
        redirect_to new_session_url
    end

end