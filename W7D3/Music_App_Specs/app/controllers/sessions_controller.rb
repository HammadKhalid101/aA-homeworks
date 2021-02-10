class SessionsController < ApplicationController
    def new
        @user = User.new
        # render json: @user
        render :new
    end

    def create 
        @user = User.find_by_credentials(
            params[:user][:email],
            params[:user][:password]
        )

        if @user
            login!(@user)
            redirect_to user_url(@user)
            # render plain: "success"
        else
            flash[:errors] = ["Invalid Credentials"]
            redirect_to new_session_url
        end
    end

    def destroy
        logout!
        redirect_to new_session_url
    end
end