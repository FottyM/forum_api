module Api
  module V1
    class AnswersController < ApplicationController
      before_action :set_answer, only: [:show, :update, :destroy]
      before_action :set_question, except: [:show]

      def index
        @answers = @question.answers.all
        render json: @answers, status: :ok
      end

      def show
        render json: @answer
      end


      def create
        @answer = @question.answers.new(answer_params)
        if @answer.save
          render json: @answer, status: :created
        else
          render json: @answer.errors, status: :unprocessable_entity
        end
      end

      def update
        if @answer.update(answer_params)
          render json: @answer
        else
          render json: @answer.errors, status: :unprocessable_entity
        end
      end


      def destroy
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
        params.require(:answer).permit(:content, :question_id)
      end
    end
  end
end
