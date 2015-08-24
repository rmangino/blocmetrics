# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'

###############################################################################

# Clear out existing data

User.destroy_all

###############################################################################

# Helpers

def create_user(name, email, password)
  user = User.new(name: name, email: email, password: password)
  user.skip_confirmation!
  user.save!
end

###############################################################################

# Create Users

user1 = create_user('User1', 'user1@example.com', "helloworld")
user2 = create_user('User2', 'user2@example.com', "helloworld")
reed  = create_user('Reed', 'reed@themanginos.com', "helloworld")

###############################################################################

# Create RegisteredApplications

APPLICATIONS_INFO = [ { app_name: "Twitter", app_url: "http://twitter.com"},
                      { app_name: "Heroku",  app_url: "http://heroku.com"},
                      { app_name: "Dropbox", app_url: "http://dropbox.com"} ]

DOM_EVENT_NAMES = %w(click complete copy cut scroll)

User.all.each do |user|

  APPLICATIONS_INFO.each do |app|
    registered_app = RegisteredApplication.create!(user: user, name: app[:app_name], url: app[:app_url])

    # For each registered app generate some simulated events
    rand(1..15).times do
      Event.create!(registered_application: registered_app, name: DOM_EVENT_NAMES.sample)
    end

  end
end

###############################################################################

# Report results

puts "Seed Finished"
puts "#{User.count} Users created"
puts "#{RegisteredApplication.count} RegisteredApplications created"
puts "#{Event.count} Events created"