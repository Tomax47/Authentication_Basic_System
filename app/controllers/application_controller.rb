class ApplicationController < ActionController::Base
  #If we want a method we add in the controller to be available to the view
  # wwe have to make it available, bu using the helper_method!
  helper_method :current_user
  helper_method :has_posts

  def ensure_current_user
    if current_user.nil?
      redirect_to sign_in_path
    end
  end

  def has_posts
    if current_user.blogposts.count == 0
      flash.now[:notice] = "No blogposts shared!"
    end
  end


  #Here's the method which will make us check who's the current user!
  def current_user

    #The session will create a userID thought it wont be shown in the cookies on the browser, thus it's a safer approach!! <It will maintain things just like the cookies will>
    if session[:user_id]
      User.find(session[:user_id])
    end


    #USING THE COOKIE INSTEAD OF THE SESSION[:user_id] :

    #The if statement checks if the cookie has a user_id <if the user is logged in>, the method will check the user in the db
    # else, if won't <To avoid errors>

    #if cookies[:user_id]
    # User.find(cookies.encrypted.signed[:user_id])
    #end

  end

end
