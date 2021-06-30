class Event < ApplicationRecord
  belongs_to :creator, foreign_key: "organisation_id", class_name: "User"
end
