# frozen_string_literal: true

module Api
  class CurrentInfosController < ApplicationController
    def index
      @message = ''
      begin
        @message = Message.all[0].content
      rescue StandardError
        @message = ''
      end
      render json: { message: @message }
    end
  end
end
