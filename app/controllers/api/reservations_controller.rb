# frozen_string_literal: true

module Api
  class ReservationsController < ApplicationController
    def_param_group :reservation do
      param :id, :number, desc: 'reservations id'
      param :reservation, Hash do
        param :start_date, String, required: true, desc:'Start date of reservation'
        param :city, String, required: true, desc:'City of client reservation'
        param :user_id, String, required: true, desc:'The id of the client'
        param :car_id, String, required: true, desc:'The id of the reserved car'
      end
      property :car_id, String, desc:'Id of car to be reserved'
      property :user_id, String, desc:'Id of the client who asks for reservation'
      property :start_date, String, desc:'Start date of reservation reservation'
      property :city, String, desc:'the city of the car reservation'
      property :created_at, String, desc: 'Date of the reservation creation'
      property :updated_at, String, desc: 'Last time the reservation was updated'
    end
    api :GET, '/reservations', 'Show all reservations'
    def index
      @reserves = Reservation.all
      render json: { reserves: @reserves }.to_json
    end
    api :POST, '/reservations/', 'Add a new reservation'
    returns :reservation, code: 200, desc: 'Manage like'  
    param_group :reservation
    def create
      reserve = Reservation.new(reserve_param)
      if reserve.save
        respond_to do |format|
          format.json { render json: 'reserved sucessfully'.to_json, status: :ok }
        end
      else
        respond_to do |format|
          format.json { render json: 'Something went wrong'.to_json, status: :ok }
        end
      end
    end

    def update
      @reservation = Reservation.find(update_param[:id])
      if @reservation.update(update_param)
        render json: @reservation
      else
        render json: @reservation.errors, status: :unprocessable_entity
      end
    end

    api :DELETE, '/reservations/:id', 'Delete a specific reservation'
    returns code: 200, desc: 'Reservation successfully deleted.'
    def destroy
      @reservation = Reservation.find(params[:id])
      if @reservation.destroy
        render json: { reservation: @reservation, message: 'Reservation successfully deleted' }
      else
        render json: @reservation.errors, status: :unprocessable_entity
      end
    end

    private

    def update_param
      params.require(:reservation).permit(:id, :start_date, :city, :user_id, car_id)
    end

    def reserve_param
      params.require(:reservation).permit(:start_date, :city, :user_id, :car_id)
    end
  end
end
