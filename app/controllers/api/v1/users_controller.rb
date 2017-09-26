module Api
  module V1
    class UsersController < ApplicationController
      before_action :set_user, except: [:create, :index]
      before_action :authenticate_request, except: [:create, :index]
      before_action :can_modify?, only:[:update, :destroy]

      def index
        @users = User.order('username ASC')
        render json: @users.map { |user| user.attributes.except('password_digest', 'updated_at') }
      end

      def show
        render json: @user.attributes.except('password_digest')
      end

      def create
        @user = User.new user_params
        if @user.save
          render json: @user.attributes.except('password_digest', 'updated_at'), status: :created
        else
          render json: @user.errors, status: :unprocessable_entity
        end
      end

      def update
        if can_modify?
          if @user.update(user_params)
            render json: @user.attributes.except('password_digest', 'created_at'), status: :ok
          else
            render json: @user, status: :unprocessable_entity
          end
        else
          render json: { error: "Unauthorized action"}, status: :unauthorized
        end
      end

      def destroy
        if can_modify?
          @user.destroy
          render json: { message: 'successfuly deleted'}, status: :deleted
        else
          render json: { error: "Unauthorized action"}, status: :unauthorized
        end

      end

      private

      def can_modify?
        current_user.id.to_i == params[:id].to_i || current_user.admin?
      end

      def set_user
        @user = User.find params[:id]
      end

      def user_params
        params.require(:user).permit(:username, :email, :password, :password_confirmation, :admin)
      end

    end
  end
end
