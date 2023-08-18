class ChangePasswordToPasswordDigest < ActiveRecord::Migration[7.0]

  #After running the code <rails g migration change_password_to_password_digest>, we will set this change function
  # so it changes the password name in the database <the password field id>, as a part og the process of not storing the password in our database!!
  def change
    rename_column :users, :password, :password_digest
  end
end
