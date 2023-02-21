class Event < ApplicationRecord
  has_many :attendances
  has_many :users, through: :attendances
  belongs_to :administrator, class_name: 'User', foreign_key: 'administrator_id'
  validates :title, presence: true, length: {in: 5..140}
  validates :description, presence: true, length: {in: 20..1000}
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 1000, message: "Le tarif doit être compris entre 1 et 1000 €" }
  validates :location, presence: true
  validates :duration, presence: true, numericality: { greater_than: 0, divisible_by: 5 }
  validates :start_date, presence: true, comparison: { greater_than: Time.now}

end
