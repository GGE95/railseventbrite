class Event < ApplicationRecord
  has_many :attendances
  has_many :users, through: :attendances
  belongs_to :administrator, class_name: 'User', foreign_key: 'administrator_id'
  validate :title, presence: true, length: {in: 5..140}
  validate :description, presence: true, length: {in: 20..1000}
  validate :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 1000, message: "Le tarif doit être compris entre 1 et 1000 €" }
  validate :location, presence: true
  validate :duration, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validate :multiple_of_five
  validate :start_date, presence: true
  validate :date_cannot_be_in_past

  private

  def multiple_of_five
    if duration.present? && duration % 5 != 0
      errors.add(:duration, "doit être un multiple de 5")
    end
  end

  def date_cannot_be_in_past
    if start_date.present? && start_date < Date.today
      errors.add(:start_date, "ne peut pas être dans le passé")
    end
  end

end
