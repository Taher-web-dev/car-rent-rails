class Api::UsersController < ApplicationController
  def index
    @users = User.all
    render json: { users: @users }
  end

  def create
    @user = User.new(user_params)
    if @user.save
      if Message.all.length == 0
        Message.create(content: 'User created successfully.', statut: true)
      else
        idd = Message.ids[0]
        @message = Message.find(idd)
        @message.update(content: 'User created successfully.', statut: true)
      end
    else
      if Message.all.length == 0
        Message.create(content: 'User could not be created!', statut: false)
      else
        idd = Message.ids[0]
        @message = Message.find(idd)
        @message.update(content: 'User could not be created!', statut: false)
      end
    end
  
  end

  private 
  def user_params
    params.require(:user).permit(:username, :city, :photo)
  end
end
