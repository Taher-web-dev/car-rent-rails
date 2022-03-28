class Api::CurrentInfosController < ApplicationController
  def index
    @message = nil
    begin
      @message = Message.all[0]
    rescue
      @message = nil
    end
    render json: { message: @message }
  end
end
