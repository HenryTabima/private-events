class Event < ApplicationRecord
  belongs_to :creator, class_name: "User"

  has_many :attendants, foreign_key: :attended_event_id
  has_many :attendees, through: :attendants, source: :attendee

  def Event.past
    self.where('event_date < ?', Time.now)
  end

  def Event.upcoming
    # Event.where(event_date: > Time.now)
    self.where('event_date > ?', Time.now)
  end
end
