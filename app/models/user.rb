class User < ApplicationRecord

  #Active Record Associations: This will take the foreign-key of the nlog post and associate them with the user_id, if it matches, then it will return this post as a post of the user!
  has_many :blogposts

  #it makes sure that no tow same email are able to create many accounts!
  # and that the email is not null!
  validates :email, uniqueness: true
  validates :email, presence: true

  #validate the password length of 9 min, and we allowing the nil value of the password, cuz fe when we wanna update the email or the profile picture let's say, we won't be passing a password value!
  validates :password, length: {minimum: 6, allow_nil: true}



  def password
    @password
  end


  def password=(raw)

    @password = raw #here we are saving the password in the memory foe a second without passing it to the database! so we can use it in the password function, to be able to call it in the validation to verify the null or the min 5 characters password!

    #This will give us back a hashed password from the raw one, and store the hashed password inside of the database!!
    self.password_digest = BCrypt::Password.create(raw)
  end

  def is_password?(raw)
    #Here we ain't used a self.password_digest, cuz we here creating a local variable sorta inside of this method
    # While the password def, is a setter method, thus it's a MUST to use the <self.> PREFIX to tell rails that this is a setter method!
    BCrypt::Password.new(password_digest).is_password?(raw)
  end
end
