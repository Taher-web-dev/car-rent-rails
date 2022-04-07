# frozen_string_literal: true

class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true
  validates :photo, presence: false
  has_many :likes, dependent: :destroy
  has_many :reservations, dependent: :destroy

end
