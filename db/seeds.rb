# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
henry = User.create!(name: 'Henry', email: 'h@me.com')
sunny = User.create!(name: 'Sunny', email: 's@me.com')

users = [henry, sunny]

users.each do |user|
  2.times do |i|
    event = user.events.create!(name: "#{user.name}'s party #{i + 1}",
                                location: "#{user.name}'s house'",
                                event_date: 3.days.from_now)
    event.attendees += users
  end
  2.times do |i|
    event = user.events.create!(name: "#{user.name}'s past party #{i + 1}",
                                location: "#{user.name}'s house'",
                                event_date: 3.days.ago)
    event.attendees += users
  end
end
