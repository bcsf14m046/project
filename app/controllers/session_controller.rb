class SessionController < ApplicationController
  
def new
end

def create
  @cu = login(params[:email], params[:password])
  if cu
    redirect_back_or_to subjects_url, :notice => "Logged in!"
  else
    flash.now.alert = "Email or password was invalid"
    render :new
  end
end

def destroy
  logout
  redirect_to (:action=>'list', :notice => "Logged out!"
end


end
