module V1
    class FriendshipsController < ApplicationController
        before_action :set_user, except: [:index, :requested_friends]

        def index
            @users = current_user.pending_friends
            render :template => "v1/users/index", status: :ok
        end
        def create
            current_user.friend_request(@user)
            render  :template => "v1/users/show", status: :ok
        end

        def requested_friends
            @users = current_user.requested_friends
            render :template => "v1/users/index", status: :ok
        end

        def update
            current_user.accept_request(@user)
            render  :template => "v1/users/show", status: :ok            
        end

        def decline
            current_user.decline_request(@user)
            render  :template => "v1/users/show", status: :ok                        
        end

        def destroy
            current_user.remove_friend(@user)
            render  :template => "v1/users/show", status: :ok                        
        end

        private
        def set_user
            @user = User.find(params[:user_id])
        end

    end
end