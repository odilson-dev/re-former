class UsersController < ApplicationController
    
    def new
    end

    def create
        # @users = User.new(username: params[:username], email: params[:email], password: params[:password])

        @users = User.new(user_params)

        if @users.save
            redirect_to new_user_path
        else
            render :new, statuse: :unprocessable_entity
        end

    end

    private

    def user_params

        params.require(:user).permit(:username, :email, :password)

    end
end
