class SessionsController < ApplicationController
    def new
    end

    def create
        # cherche s'il existe un utilisateur en base avec l’e-mail
        user = User.find_by(email: params[:identifiant])
      
        # on vérifie si l'utilisateur existe bien ET si on arrive à l'authentifier (méthode bcrypt) avec le mot de passe 
        if user && user.authenticate(params[:password])
          session[:user_id] = user.id
            redirect_to gossips_path
        else

          flash.now[:danger] = 'Invalid email/password combination'
          render 'new'
          
        end
     
    end

    def destroy
        session.delete(:user_id)
        redirect_to new_session_path
    end

end
