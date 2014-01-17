# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Environment variables (ENV['...']) can be set in the file config/application.yml.
# See http://railsapps.github.io/rails-environment-variables.html

## Constants
USERS = [
  {
    :name => 'moderator',
    :email => 'moderator@bahailan.com',
    :password => '1qazxsw2',
    :role => 'moderator'
  },
  {
    :name => 'editor',
    :email => 'editor@bahailan.com',
    :password => '1qazxsw2',
    :role => 'editor'
  },
  {
    :name => 'guest',
    :email => 'guest@bahailan.com',
    :password => '1qazxsw2',
    :role => 'guest'
  }
]


## Reset all data
Role.delete_all
User.delete_all
clear_users_roles = "DELETE FROM users_roles"
ActiveRecord::Base.connection.execute(clear_users_roles)


## Add roles
puts 'ROLES'
YAML.load(ENV['ROLES']).each do |role|
  Role.find_or_create_by_name({ :name => role }, :without_protection => true)
  puts 'role: ' << role
end

## Default admin user
puts 'DEFAULT USERS'
user = User.find_or_create_by_email :name => ENV['ADMIN_NAME'].dup, :email => ENV['ADMIN_EMAIL'].dup, :password => ENV['ADMIN_PASSWORD'].dup, :password_confirmation => ENV['ADMIN_PASSWORD'].dup
puts 'user: ' << user.name
user.add_role :admin

## Other users
users = USERS
users.each do |user|
  u = User.find_or_create_by_email(
    :name => user[:name],
    :email => user[:email],
    :password => user[:password],
    :password_confirmation => user[:password]
  )
  u.add_role(user[:role])
  p "Added user: #{user[:name]} as a/an #{user[:role]}"
end
