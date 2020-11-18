class SessionsController < ApplicationController

  def create
    if user = user.authenticate_with_credentials(prams[:password], prams[:email])
      # Save the user id inside the browser cookie. This is how we keep the user 
      # logged in when they navigate around our website.
      session[:user_id] = user.id
      redirect_to '/'
      retun user
    else
    # If user's login doesn't work, send them back to the login form.
      redirect_to '/login'
      return user = nil
    end
    
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end

  
end
