class UsersController < ApplicationController
    before_action :require_logged_out

    def index
        @users = User.all
        render :index
    end
    def new
        @user = User.new
        render :new
    end

    def show
        @user = User.find_by(id: params[:id])
        render :show
    end
    def create
        @user = User.new(user_params)

        if @user.save
            login!(@user)
            redirect_to session_url #----incomplete
        else
            flash.now[:errors] = @user.errors.full_messages
            render :new
        end
    end

    
    private

    def user_params
        params.require(:user).permit(:email, :password)
    end
end