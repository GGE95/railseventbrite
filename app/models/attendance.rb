class Attendance < ApplicationRecord
  belongs_to :user
  belongs_to :event

  after_create :admin_send

  def admin_send
    AdminMailer.participation_email(self).deliver_now
  end


end
