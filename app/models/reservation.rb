# frozen_string_literal: true

class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :car
  validates :start_date, presence: true
  validates :city, presence: true
end
