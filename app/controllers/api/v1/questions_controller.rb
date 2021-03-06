module Api
  module V1
    class QuestionsController < ApplicationController
      before_action :set_question, only: [:show]
      before_action :authenticate_request, except: [:index, :show]

      def index
        @questions = Question.order('updated_at DESC')
        render json: @questions.map { |question| question.attributes.merge( {author: question.user.username, answers_count: question.answers.count })}
      end

      def show
        render json: @question.attributes.merge({author: @question.user.username })
      end

      def create
        @question = current_user.questions.new(question_params)
        if @question.save
          render json: @question, status: :created
        else
          render json: @question.errors, status: :unprocessable_entity
        end
      end

      def update
        if current_user.present? && current_user.admin?
          @question =  Question.find(params[:id])
        else
          @question = current_user.questions.find(params[:id])
        end

        if @question.update(question_params)
          render json: @question
        else
          render json: @question.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @question = current_user.admin? ? Question.find(params[:id]) : current_user.questions.find(params[:id])
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
