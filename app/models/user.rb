class User < ApplicationRecord
  has_many :user_hangouts
  has_many :hangouts, through: :user_hangouts
  has_and_belongs_to_many :interests
  has_secure_password

  def user_interests
    self.interests.map do |interest|
      interest.name
    end
  end

  def self.all_users
    users = {}
    User.all.each do |user|
      # users[user.id] = []
      users[user.id] = user.user_interests
    end
    #in this users hash the keys will be the user ids and the values will be an array of the users interests
    users
  end

  def find_common_interests(interests, current_user)
    total_interests_in_common = 0
    interests.each do |interest|
       if current_user.user_interests.any?(interest)
          total_interests_in_common += 1
       end
    end
    total_interests_in_common
  end

  def is_a_match(total_interests_in_common)
    if total_interests_in_common >= 2
      return true
    end
    return false
  end

  def match
    users_that_match = []
    User.all_users.each do |user_id, interests_array|
      total_match = find_common_interests(interests_array, self)
        if (is_a_match(total_match) == true) && (user_id != self.id)
          users_that_match << user_id
        end
    end
    users_that_match
  end

end
