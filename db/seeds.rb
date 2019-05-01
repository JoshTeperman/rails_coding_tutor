require_relative '../lib/seeds/seeds.rb'

puts 'Destroying old records...'
User.destroy_all

# SEEDING       ------------------------------------------------------------->

puts 'Starting Seeding...'

# ADMIN USER    ------------------------------------------------------------->

puts 'Creating Admin User'
user = User.new(email: 'admin@admin.com', password: 'password', password_confirmation: 'password', admin?: true, moderator?: true)

user.skip_confirmation!
user.save

profile = user.create_profile(tutor?: true, first_name: 'Admin', surname: 'User', skills: 'none', bio: 'Administrator', average_rating: 0, hourly_rate: 0)
profile.save

# MODERATOR USER  ------------------------------------------------------------->

puts 'Creating Moderator User'
user = User.new(email: 'moderator@moderator.com', password: 'password', password_confirmation: 'password', admin?: false, moderator?: true)
user.skip_confirmation!
user.save

profile = user.create_profile(tutor?: true, first_name: 'Moderator', surname: 'User', skills: 'none', bio: 'Moderator', average_rating: 0, hourly_rate: 0)
profile.save


# STUDENT USERS  ------------------------------------------------------------->

puts 'Creating Student Users'

5.times do

  seed_email = 'admin@admin.com'
  while User.exists?(email: seed_email)
    seed_email = EMAILS.sample
  end
  
  p seed_email
  user_params = {
    email: seed_email,
    password: 'password',
    password_confirmation: 'password',
    admin?: false,
    moderator?: false
  }
  profile_params = {
    tutor?: false,
    first_name: FIRST_NAMES.sample,
    surname: SURNAMES.sample,
    skills: SKILLS.sample(rand(3..20)).join(', '),
    bio: BIOS.sample,
    average_rating: nil,
    hourly_rate: nil
  }
  puts "Seeding Student: #{profile_params[:first_name]} #{profile_params[:surname]}"
  user = User.create!(user_params)
  user.skip_confirmation!
  user.save

  # Create Student User Profiles
  student_user_profile = user.create_profile(profile_params)
  student_user_profile.save
end

# TUTOR USERS   ------------------------------------------------------------->

puts 'Creating Tutor Users'

5.times do

  seed_email = 'admin@admin.com'
  while User.exists?(email: seed_email)
    seed_email = EMAILS.sample
  end
  
  p seed_email
  user_params = {
    email: seed_email,
    password: 'password',
    password_confirmation: 'password',
    admin?: false,
    moderator?: false
  }
  profile_params = {
    tutor?: true,
    first_name: FIRST_NAMES.sample,
    surname: SURNAMES.sample,
    skills: SKILLS.sample(rand(3..20)).join(', '),
    bio: BIOS.sample,
    average_rating: rand(0.0..5.0),
    hourly_rate: rand(20.00..200.00)
  }
  puts "Seeding Tutor: #{profile_params[:first_name]} #{profile_params[:surname]}"
  user = User.create!(user_params)
  user.skip_confirmation!
  user.save

  # Create Tutor User Profiles
  tutor_user_profile = user.create_profile(profile_params)
  tutor_user_profile.save
end

# BOOKINGS   ------------------------------------------------------------->
puts 'Seeding bookings'


puts 'Finished seeding'



# Notes
# =====================

# Not seeding the following User attributes for now:
  # reset_password_token: nil,
  # reset_password_sent_at: nil,
  # remember_created_at: nil,
  # created_at: nil,
  # updated_at: nil,
  # confirmation_token: nil,
  # confirmed_at: nil,
  # confirmation_sent_at: nil