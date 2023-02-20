class User < ApplicationRecord
  has_many :attendances
  has_many :events, through: :attendances
  has_many :created_events, class_name: 'Event', foreign_key: 'administrator_id'
end
