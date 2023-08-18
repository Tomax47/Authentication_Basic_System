class SessionsController < ApplicationController

  #We gonna use the user model, cuz that's the model that gon store the email and the password/or smthng
  def new
    #Here we just initialize an empty user!
    @user = User.new
  end

  def create
    #Here we gon write the logic for checking if the user exit in the database, so we cookie them and then keep track of the requests during the sessio!
    #Look up the user in the db :
    @user = User.find_by(email: user_params[:email]) #Here we tell the method to find the user in the db by email, and what's the email that it's gon look it up in the db? -> it's the email which we will get from the <users_params[:email]> this line tells the method that get the email inputted!

    #Here we check if the user exist && the password passed by the client matches the looked up user's password!
    if @user && @user.is_password?(user_params[:password])

      session[:user_id] = @user.id

      #USING COOKIES INSTEAD OF session[:user_id] :

      #cookies.encrypted.signed[:user_id] = @user.id #Here we MUSTN'T leave the cookie as a plain text, as in the browser>inspect>application>cookies the value of the user_id gon be exposed, thus we will have to encrypt it!!!
      #Cookies documentation > https://api.rubyonrails.org/classes/ActionDispatch/Cookies.html <we used the .encrypt & .signed methods to turn the user_id from 1,2,3 etc.. to something like this : qHtfxw1A2k3z0oZu0qyYM1Vu9gpIudV3IDbrUOdyNCcJr7%2F7GQ3mBNY0CUAciPUGd2YkyJE9r%2FmGqRpncTU%2FpwtKsklpwcf%2FeaAD4kz8AZgqUYniOm7Xv%2Bxjom%2B903NDgXuGBriA81zyet5BJa6pMKfrApVePtcIoncZ9cf9w9jebvbDfeyl1ExRynXFqtMTo5PfVp1x2m%2BDZHC7LxMTiffVJbpZNI2j67551%2FG%2FMs4%2ByOSqeY8B%2FogTlG9Ff9U9grL8ZNeZ54pYoDyMjw%2FCso43pSuvrNuCDIjOXpTOirUDal48VRGa--yUol90jkaNV4yyqk--yk7c17Ut%2BtYb7ZDsoUN%2Bgg%3D%3D
      # Theoretically, if someone managed to somehow get that user_id encrypted cookie value, then they will be able to log in using it!


      redirect_to blogposts_path

    else
      redirect_to sessions_new_path, notice: "Invalid email or password!"
    end


  end


  #This method is to kill the session <to sign the user out>
  def destroy
    #We logged in when the user_id was not nil and equaled the @user.id
    # So to logout, we will assign the the value nil to the user_id
    session[:user_id] = nil
    redirect_to root_path
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end
end
