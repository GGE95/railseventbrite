class User < ApplicationRecord
  has_many :attendances
  has_many :events, through: :attendances
  has_many :created_events, class_name: 'Event', foreign_key: 'administrator_id'
  validates :email, presence: true
  after_create :welcome_send

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end

  

end
