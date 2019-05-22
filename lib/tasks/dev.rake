# frozen_string_literal: true

if Rails.env.development? || Rails.env.test?
  require 'factory_bot'

  namespace :dev do
    desc 'Sample data for local development environment'
    task populate: 'db:migrate:reset' do
      include FactoryBot::Syntax::Methods
      10.times do
        create(:user) do |user|
          3.times { user.events.create(attributes_for(:event)) }
        end
      end

      Event.all.each do |event|
        event.attendees += User.all.sample(5)
      end
    end
  end
end
