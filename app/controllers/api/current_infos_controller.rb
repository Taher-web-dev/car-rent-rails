class Api::CurrentInfosController < ApplicationController
  def index
    @message = ''
    begin
      @message = Message.all[0].content
    rescue
      @message = ''
    end
    render json: { message: @message }
  end
end
