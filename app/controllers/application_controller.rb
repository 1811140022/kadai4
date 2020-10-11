class ApplicationController < ActionController::Base
    def R4
        session[:c] ||= 0
        session[:c] = session[:c].to_i + 1
        render plain: session[:c]
    end
end
