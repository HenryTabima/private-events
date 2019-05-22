# frozen_string_literal: true

class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  has_many :attendants, foreign_key: :attended_event_id
  has_many :attendees, through: :attendants, source: :attendee

  default_scope -> { order(:date) }
  scope :past, -> { where('event_date < ?', DateTime.current) }
  scope :upcoming, -> { where('event_date > ?', DateTime.current) }

end
