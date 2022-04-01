# frozen_string_literal: true

module Api
  class UsersController < ApplicationController
    def index
      @users = User.all
      render json: { users: @users }
    end

    def create
      @user = User.new(user_params)
      if @user.save
        respond_to do |format|
          format.json { render json: 'User created successfully.'.to_json, status: :created }
        end
      else
        respond_to do |format|
          format.json { render json: 'User could not be created!'.to_json, status: :not_created }
        end
      end
    end

    private

    def user_params
      params.require(:user).permit(:username, :city, :photo)
    end
  end
end
