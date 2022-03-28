class Car < ApplicationRecord
    validates :brand , presence: true, length: { maximum: 20 }
    validates :model , presence: true, length: { maximum: 20 }
    validates :model_year , presence: true, numericality: { greater_than: 1900 }, length: { maximum: 4 }
    validates :photo_url , presence: true
    validates :description , presence: true, length: { maximum: 100}

end
