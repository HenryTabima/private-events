class User < ApplicationRecord
  has_many :events, foreign_key: :creator_id

  has_many :attendants, foreign_key: :attendee_id
  has_many :attended_events, through: :attendants, source: :attended_event


  def previous_events
    # Event.where(event_date: < Time.now)
    # self.attended_events.where('event_date < ?', Time.now)
    self.attended_events.past
  end

  def upcoming_events
    # Event.where(event_date: > Time.now)
    self.attended_events.where('event_date > ?', Time.now)
  end



end
