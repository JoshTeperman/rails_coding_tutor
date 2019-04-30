

skills = ['HTML', 'CSS', 'Sass', 'CSS Animations', 'JavaScript', 'Ruby', 'Ruby on Rails', 'PostgreSQL', 'Java', 'Python', 'Markdown', 'TypeScript', 'Scala', 'Kotlin', 'C', 'C#', 'C++', 'Objective-C', 'PHP', '.NET', 'SQL', 'Fortran', 'Perl', 'Django', 'Clojure', 'Lisp', 'Cobol', 'Haskell', 'Rust', 'MongoDB', 'Elixir', 'Node.js', 'Express.js', 'JQuery', 'React.js', 'WebAssembly', 'VBA', 'Microsoft Excel', 'Go', 'OOP', 'Unit Testing', 'Automated Testing', 'User Testing', 'TDD', 'UI/UX', 'DevOps', 'Site Reliability Testing', 'Crying', 'Talking Smack', 'Donald Trump Jokes', 'Twitter', 'Borrowing money from my Parents', 'Making fun of Bootcamp grads', 'Regret']

profile_params = {
  tutor?: true,
  first_name: 'Admin',
  surname: 'User',
  skills: skills.sample(rand(3..20)).join(', '),
  bio: 'placeholder',
  average_rating: rand(0.0..5.0),
  hourly_rate: rand(20.00..200.00)
}

puts "Destroying old records..."
User.destroy_all

# SEEDING -->
puts "Starting Seeding..."

# ADMIN 
puts 'Creating Admin User'
user = User.new(email: 'admin@admin.com', password: 'password', password_confirmation: 'password', admin?: true, moderator?: true)
user.skip_confirmation!
user.save

admin_user_profile = user.create_profile(profile_params)
admin_user_profile.save


# MODERATOR
puts 'Creating Moderator User'
user = User.new(email: 'moderator@moderator.com', password: 'password', password_confirmation: 'password', admin?: false, moderator?: true)
user.skip_confirmation!
user.save

moderator_user_profile = user.create_profile(profile_params)
moderator_user_profile.save


# puts 'Creating Student Users'
# create Normal Users (students only)
# Create Normal User Profiles

# puts 'Creating Tutor Users'
# create Normal Users (tutors: true)
# create Normal User Profiles



puts 'Finished seeding'


# 10.times do 
#   author_name = Faker::Book.author
#   author = Author.create({name: author_name})
#   5.times do
#     title = Faker::Book.title
#     description = Faker::Book.genre
#     rating = rand(1..5)
#     # author_id = author.id
#     book = Book.new({title: title, description: description, rating: rating})
#     book.author_id = author.id
#     book.save

#     3.times do
#       book.reviews.create({title: Faker::Artist.name, review: Faker::Restaurant.review})
#     end
#   end
# end



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