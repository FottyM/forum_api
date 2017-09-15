module Api
  module V1
    class QuestionsController < ApplicationController
      before_action :set_question, only: [:show, :update, :destroy]
      before_action :authenticate_request, except: [:index, :show]

      def index
        @questions = Question.order('updated_at DESC')
        render json: @questions
      end

      def show
        render json: @question
      end

      def create
        @question = Question.new(question_params)
        if @question.save
          render json: @question, status: :created
        else
          render json: @question.errors, status: :unprocessable_entity
        end
      end

      def update
        if @question.update(question_params)
          render json: @question
        else
          render json: @question.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @question.destroy
      end

      private
      def set_question
        @question = Question.find(params[:id])
      end

      def question_params
        params.require(:question).permit(:title, :body)
      end

    end
  end
end