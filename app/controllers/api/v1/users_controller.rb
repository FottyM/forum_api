module Api
  module V1
    class UsersController < ApplicationController
      before_action :set_user, except: [:create, :index]
      before_action :authenticate_request, except: [:create, :index]

      def index
        @users = User.order('username ASC')
        render json: @users
      end

      def show
        render json: @user
      end


      def create
        @user = User.new user_params
        if @user.save
          render json: @user, status: :created
        else
          render json: @user.errors, status: :unprocessable_entity
        end
      end

      def update
        if @user.update(user_params)
          render json: @user, status: :ok
        else
          render json: @user, status: :unprocessable_entity
        end
      end

      def destroy
        @user.destroy
      end


      private

      def set_user
        @user = User.find params[:id]
      end

      def user_params
      params.require(:user).permit( :username, :email, :password, :password_confirmation, :admin )
      end

    end
  end
end

