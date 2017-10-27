class ApplicationController < ActionController::API
    acts_as_token_authentication_handler_for User, fallback: :none 
    include DeviseTokenAuth::Concerns::SetUserByToken

    def current_user
        @current_user
    end     
end
