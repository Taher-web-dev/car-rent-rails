# frozen_string_literal: true

module Api
  class UsersController < ApplicationController
    def_param_group :user do
      param :id, :number, desc: 'user id'
      param :user, Hash do
        param :username, String, required: true, desc:'Username of the new user.'
        param :city, String, required: false, desc:'Adress city of the new user.'
        param :photo, String, required: false, desc:'link for user photo profile.'
      end
      property :username, String, desc:'Username of the new user.'
      property :city, String, desc:'Adress city of the new user.'
      property :photo, String, desc:'link for user photo profile.'
      property :created_at, String, desc: 'Date of the user creation'
      property :updated_at, String, desc: 'Last time the user was updated'
      property :role, String, desc: 'The role od the user.'
  
    end
    api :GET, '/cars', 'Show all users'
    def index
      @users = User.all
      render json: { users: @users }
    end
    api :POST, '/users/', 'Add a new user'
    returns :user, code: 200, desc: 'Add user'  
    param_group :user
    def create
      @user = User.new(user_params)
      if @user.save
        respond_to do |format|
          format.json { render json: 'User created successfully.'.to_json, status: :created }
        end
      else
        respond_to do |format|
          format.json { render json: 'User could not be created!'.to_json, status: :unprocessable_entity }
        end
      end
    end

    private

    def user_params
      params.require(:user).permit(:username, :city, :photo)
    end
  end
end
