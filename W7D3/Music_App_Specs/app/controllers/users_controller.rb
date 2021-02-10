class UsersController < ApplicationController
    # before_action :require_logged_out, only: [:new, :create]
    # before_action :require_logged_in, only: [:index, :show]

    def show
        user = User.find(params[:id])
        # render json: user
        render :show
    end

    def new
        @user = User.new
        # render json: @user
        render :new
    end

    def create
        @user = User.new(user_params)
        
        if @user.save
            login!(@user)
            redirect_to user_url(@user)
        else
            flash.now[:errors] = @user.errors.full_messages
            # render json: @user
            render :new
        end
    end

    # def edit 
    #    user = User.find_by(id: params[:id]) 
    #    render :eidt
    # end

    private

    def user_params
        params.require(:user).permit(:email, :password)
    end
end