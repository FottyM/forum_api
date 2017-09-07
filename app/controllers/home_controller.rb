class HomeController < ApplicationController
  def index
    render json: {message: "Welcome to Mutunda's forum api "}, status: :ok
  end
end
