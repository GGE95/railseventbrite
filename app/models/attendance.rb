class Attendance < ApplicationRecord
  belongs_to :user
  belongs_to :event
  validates :stripe_customer_id, presence: true
  after_create :admin_send

  def admin_send
    admin = self.event.administrator
    user = self.user
    event = self.event
    AdminMailer.participation_email(admin, user, event).deliver_now
  end


end
