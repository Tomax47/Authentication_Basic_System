class Blogpost < ApplicationRecord

  #ACTIVE RECORD ASSOCIATIONS
  # The Active Record Associations, will allow us to pass a variable of a specific user, and then call the posts this users created, and many other things!

  belongs_to :user #this takes the foreign-key the blogpost has, and go associate it with the user_id related to it, in order to find the user who created this blogpost!

end
