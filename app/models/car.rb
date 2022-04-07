# frozen_string_literal: true

class Car < ApplicationRecord
  validates :brand, presence: true, length: { maximum: 20 }
  validates :model, presence: true, length: { maximum: 20 }
  validates :model_year, presence: true, numericality: { greater_than: 1900 }, length: { maximum: 4 }
  validates :photo_url, presence: true
  validates :description, presence: true
  validates :likes_counter, numericality: { greater_than_or_equal_to: 0 }
  has_many :likes, dependent: :destroy
  has_many :reservations, dependent: :destroy
end
