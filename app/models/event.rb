class Event < ApplicationRecord
  has_many :attendances
  has_many :users, through: :attendances
  belongs_to :administrator, class_name: 'User', foreign_key: 'administrator_id'
  validates :title, presence: true, length: {in: 5..140}
  validates :description, presence: true, length: {in: 20..1000}
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 1000, message: "Le tarif doit être compris entre 1 et 1000 €" }
  validates :location, presence: true
  validates :duration, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :multiple_of_five
  validates :start_date, presence: true
  validates :date_cannot_be_in_past

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
