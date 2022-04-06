# frozen_string_literal: true

module Api
  class LikesController < ApplicationController
    def index
      @likes = Like.all
      render json: { likes: @likes }
    end

    def create
      @like = Like.find_by(likes_param)
      @car = Car.find(likes_param[:car_id])
      like_nbr = @car.likes_counter
      if @like
        @car.update(likes_counter: like_nbr - 1)
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
end
