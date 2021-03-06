class Event < ApplicationRecord
  scope :past, -> { where("DATE(date) < ?", Date.today) }
  scope :upcoming, -> { where("DATE(date) >= ?", Date.today) }
  belongs_to :creator, foreign_key: "user_id", class_name: "User"
  has_many :event_attendances, foreign_key: :attended_event_id
  has_many :attendees, through: :event_attendances, source: :attendee
end
