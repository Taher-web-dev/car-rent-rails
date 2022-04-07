class Api::LikesController < ApplicationController
  def_param_group :like do
    param :id, :number, desc: 'likes id'
    param :like, Hash do
      param :car_id, String, required: true, desc:'Id of car to be liked'
      param :user_id, String, required: true, desc:'Id of the user who adds likes'
    end
    property :car_id, String, desc:'Id of car to be liked'
    property :user_id, String, desc:'Id of the user who adds likes'
    property :created_at, String, desc: 'Date of the like creation'
    property :updated_at, String, desc: 'Last time the like was updated'

  end
  api :GET, '/likes/', 'Shows all likes'
  def index
    @likes = Like.all
    render json: { likes: @likes }
  end
  api :POST, '/likes/', 'Manage a new like'
  returns :like, code: 200, desc: 'Manage like'  
  param_group :like
  def create
    @like = Like.find_by(likes_param)
    @car = Car.find(likes_param[:car_id])
    like_nbr = @car.likes_counter
    if @like
      @car.update(likes_counter: like_nbr - 1 )
      @like.destroy
      respond_to do |format|
        format.json { render json: 'Likes decremented successfully!'.to_json, status: :ok }
      end
    else
      @car.update(likes_counter: like_nbr + 1)
      Like.create(likes_param)
      respond_to do |format|
        format.json { render json: 'Likes incremented successfully!'.to_json, status: :ok }
      end
    end
  end

  private
  def likes_param
    params.require(:likes).permit(:user_id, :car_id)
  end
end
