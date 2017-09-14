module Api
  module V1
    class UsersController < ApplicationController
      before_action :set_user, except: [:create]

      # def index
      #   @users = User.order('email ASC')
      #   render json: @users
      # end

      def show
        render json: @user
      end

      def create
        @user = User.new(user_params)
        if @user.save
          render json: @user, status: :created
        else
          render json: @user.errors, status: :unprocessable_entity
        end
      end

      def update
        if @user.update(user_parmas)
          render json: @user
        else
          render json: @user.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @user.destroy
        head 204
      end

      private
      def user_params
        params.require(:user)
            .permit(:email, :password, :username, :password_confirmation, :admin)
      end

      def set_user
        @user = User.find params[:id]
      end

    end
  end
end

