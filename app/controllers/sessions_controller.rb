class SessionsController < ApplicationController

    def create
        user = User.find_by(username: params[:username])
        if user&.authenticate(params[:password])
            session[:user_id] = user.id
            render json: user, status: :created
        else
            render json: {error: "error"}, status: :unauthorized
        end
    end

    def destroy
        session.clear
        # session.delete(:user_id)
        # session[:user_id] = nil
    end
end
