class User < ApplicationRecord
  has_many :events, foreign_key: :creator_id

  has_many :attendants, foreign_key: :attendee_id
  has_many :attended_events, through: :attendants, source: :attended_event

  def previous_events
    events.past
  end

  def upcoming_events
    events.upcoming
  end

end
