module Api
  module V1
    # Class of Answers
    class AnswersController < ApplicationController
      before_action :set_question
      before_action :user_answer, only: %i[update destroy]
      before_action :authenticate_request, except: [:index]

      def index
        @answers = @question.answers.order('updated_at DESC')
        render json: @answers.map { |answer|
          { content: answer.content,
            updated_at: answer.updated_at,
            author: answer.user.username,
            id: answer.id }
        }
      end

      def create
        @answer = @question.answers.new(answer_params) if current_user.present?
        if @answer.save
          render json: @answer.attributes.except('created_at')
                              .merge(author: @answer.user.username),
                 status: :created
        else
          render json: @answer.errors, status: :unprocessable_entity
        end
      end

      def update
        @answer = user_answer

        if @answer.update(answer_params)
          render json: @answer.attributes.except('created_at')
                              .merge(author: @answer.user.username),
                 status: :ok
        else
          render json: @answer.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @answer = user_answer
        @answer.destroy
        render json: @answer, status: :ok
      end

      private

      def user_answer
        answer = if current_user.admin?
                   Answer.find(params[:id])
                 else
                   current_user.answers.find(params[:id])
                 end
        answer
      end

      def set_answer
        @answer = @question.answers.find(params[:id])
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
