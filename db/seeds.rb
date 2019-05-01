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

2.times do

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

2.times do

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

  # Create Tutor User Reviews
  num_reviews = rand(0..20)

  # Select Random Reviewer
  offset = rand(User.count)
  reviewer = User.offset(offset).first

  num_reviews.times do

    review_params = {
      content: REVIEWS.sample,
      rating: rand(1..5),
      reviewer: reviewer.id
    }
    puts "Creating Review: #{review_params}"
    review = user.reviews.create(review_params)
    review.save
  end
end

# BOOKINGS   ------------------------------------------------------------->
puts 'Seeding bookings'


20.times do

  # Random Student
  students = User.joins(:profile).where(profiles: {tutor?: false})
  offset = rand(students.count)
  student = students[offset-1]
  puts "student: #{student}"

  # Random Tutor
  tutors = User.joins(:profile).where(profiles: {tutor?: true})
  offset = rand(tutors.count)
  tutor = tutors[offset-1]
  puts "tutor: #{tutor}"

  # random duration:
  duration = [15, 30, 45, 60].sample
  
  booking_params = {
    date: Time.at(rand * Time.now.to_i),
    location: LOCATIONS.sample,
    duration: duration,
    price: user.profile.hourly_rate * duration,
    tutor_id: tutor.id
  }

  puts "Seeding Booking: #{booking_params}"
  booking = Booking.new(booking_params)
  booking.save

  puts "Adding Booking to User..."
  user.bookings << booking
  user.save
end

puts 'Finished seeding'


#     @author = Author.all.find_by(name: params[:name])
#     @book = Book.new(book_params)
#     @book.authors << @author
#     @book.save


# Update the database seed to add one to three authors
# book.authors << first_author
# book.authors << second_author if rand(1..5) > 3
# book.authors << third_author if rand(1..5) > 3
