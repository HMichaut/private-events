class User < ApplicationRecord
  has_many :events, inverse_of: :creator
  has_many :event_attendances, foreign_key: :attendee_id
  has_many :attended_events, through: :event_attendances
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
