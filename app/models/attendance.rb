class Attendance < ApplicationRecord
  belongs_to :user
  belongs_to :event
  validates :stripe_customer_id, presence: true
  after_create :admin_send

  def admin_send
    AdminMailer.participation_email(self).deliver_now
  end


end
