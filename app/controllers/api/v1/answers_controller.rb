module Api
  module V1
    class AnswersController < ApplicationController
      # before_action :set_answer, only: [:update]
      before_action :set_question
      before_action :authenticate_request, except: [:index]

      def index
        @answers = @question.answers.order('updated_at DESC')
        users_ids = @answers.pluck :user_id
        @authors = User.find(users_ids).pluck(:username, :id)
        render json: { answers: @answers, authors: @authors }
      end


      def create
        @answer = @question.answers.new(answer_params) if current_user.present?
        if @answer.save
          render json: @answer, status: :created
        else
          render json: @answer.errors, status: :unprocessable_entity
        end
      end

      def update
        @answer = current_user.admin? ? Answer.find(params[:id]) : current_user.answers.find(params[:id])
        if @answer.update(answer_params)
          render json: @answer
        else
          render json: @answer.errors, status: :unprocessable_entity
        end
      end


      def destroy
        @answer = current_user.admin? ? Answer.find(params[:id]) : current_user.answers.find(params[:id])
        @answer.destroy
        render json: @answer, status: :ok
      end

      private
      def set_answer
        question  = Question.find params[:question_id]
        @answer = question.answers.find(params[:id])
      end

      def set_question
        @question = Question.find params[:question_id]
      end

      def answer_params
        params.require(:answer).permit(:content, :question_id, :user_id)
      end
    end
  end
end

