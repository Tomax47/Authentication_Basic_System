class AddUserToBlogposts < ActiveRecord::Migration[7.0]

  #The foreign-key means that at the db level, we will enforce a referential integrity, meaning there won't be any post without a foreign-key referring to an id of a valid user!
  # To generate this we ran the command <rails g migration add_user_to_blogposts user:references>
  def change
    add_reference :blogposts, :user, null: false, foreign_key: true
  end
end
