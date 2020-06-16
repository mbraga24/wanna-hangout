class User < ApplicationRecord
  belongs_to :location
  has_many :user_hangouts
  has_many :hangouts, through: :user_hangouts
  has_and_belongs_to_many :interests
  has_secure_password

  # The user_interests will collect all of the given user interests name.
  def user_interests
    self.interests.map do |interest|
      interest.name
    end
  end

  # The collect_users_and_interests method will create a hash with a group of users passed in.
  # The key/value pair will consist of the user instance as a key and that specific user interests 
  # as a value.
  def self.collect_users_and_interests
    users = {}
    User.all.each do |user|
      # Create a hash with the user instance as a key and that user interests as a value.
      users[user] = user.user_interests
    end
    # Return users hash 
    users
  end

  # The count_common_interests method will count how many interests the logged in user has 
  # with the user passed in.
  def count_common_interests(interests, current_user)
    total_interests_in_common = 0
    interests.each do |interest|
       if current_user.user_interests.any?(interest)
          total_interests_in_common += 1
       end
    end
    # return total interest count
    total_interests_in_common
  end

  # The is_a_match method will only return true or false based on a condition: 
  # The condition is whether the total_in_common is greater than or equal to a 
  # specific value.
  def is_a_match(total_in_common)
    total_in_common >= 2 ? true : false
  end

  # The match method will invoke the collect_users_and_interests, count_common_interests and the is_a_match method
  # and based on a condition save only that user instance in an array for use on views.
  def match
    users_that_match = []
    User.collect_users_and_interests.each do |user, interests_array|
      total_match = count_common_interests(interests_array, self)
        if (is_a_match(total_match) == true) && (user.id != self.id) && (user.location_id == self.location_id)
          users_that_match << user
        end
    end
    users_that_match
  end

  # The find_your_match method will find the given user id in the database.
  def create_hangout
    user_match = User.find_by(id: self.id)
  end



  # This method will run once the user selects the match
  def some_other_method
    location_type = ["Restaurant", "Park", "Movie theater", "Museum", "Roof Top", "Club", "Pub", "Church"]
    
    match_city_instance = Location.where(city: current_user.city)

    set_hangout = Hangout.create(activity: location_type.sample, location_id: match_city_instance[0].id)

    UserHangout.create(user_id: user_match.id, hangout_id: set_hangout.id, accepted: true)
    UserHangout.create(user_id: current_user.id, hangout_id: set_hangout.id, accepted: false)
  end
end 
