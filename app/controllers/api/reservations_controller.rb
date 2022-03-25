class Api::reservationsController < ApplicationController
    def index
        @reserves = Reservation.all
        render json: { reserves: @reserves }.to_json
    end

    def create
        @reserve = Reservation.new(reserve_param)
        @car = Car.find(params[:car_id])
        @reserve.user_id = current_user.id
        @reserve.car_id = @car.id
        if @reserve.save
            respond_to do |format|
              format.json { render json: 'reserved sucessfully'.to_json, status: :ok }
            end
          else
            respond_to do |format|
              format.json { render json: 'Something went wrong'.to_json, status: :ok }
            end
          end
    end

    private
    def reserve_param
        params.require(:reservation).permit(:start_date)
    end
end