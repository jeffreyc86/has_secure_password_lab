class UsersController < ApplicationController

    def new
    end

    def create
        @user = User.create(user_params)
        if params[:user][:password] != params[:user][:password_confirmation]
            flash[:errors] = @user.errors.full_messages
                redirect_to new_user_path
        else
            if @user.valid?
                session[:user_id] = @user.id
                redirect_to user_path(@user)
            else
                flash[:errors] = @user.errors.full_messages
                redirect_to new_user_path
            end
        end
    end

    private

    def user_params
        params.require(:user).permit(:name, :password)
    end

end
