class TopController < ApplicationController
  
  def main
    if session[:login_uid]
      session.delete(:login_uid)
      render :main
    else
      render :login
    end
  end

  def login
    if user(params[:uid], params[:pass]) then
      session[:login_uid] = params[:uid]
      redirect_to root_path
    else
      render :error
    end
  end
  
  def user(id, pass)
        aaa = User.find_by(uid: id)
        if aaa.nil? then
            return false
        end
        
        if BCrypt::Password.new(aaa.pass) == pass then
            return true
        end
        return false
  end
  def logout
    session.delete(:login_uid)
    redirect_to root_path

  end
end
