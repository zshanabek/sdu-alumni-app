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

        def blocked_friends
            @users = current_user.blocked_friends
            render :template => "v1/users/index", status: :ok
        end
        
        def block_user
            current_user.block_friend(@user)
            render  :template => "v1/users/show", status: :ok            
        end

        def update
            if current_user.requested_friends.include?(@user)
                current_user.accept_request(@user)
                render  :template => "v1/users/show", status: :ok                        
            else 
                render json: {'info':'Request do not exist'}
            end
        end

        def decline
            if current_user.requested_friends.include?(@user)
                current_user.decline_request(@user)
                render  :template => "v1/users/show", status: :ok                        
            else 
                render json: {'info':'Request do not exist'}
            end
        end

        def destroy
            if current_user.friends.include?(@user)
                current_user.remove_friend(@user)
                render  :template => "v1/users/show", status: :ok
            else 
                render json: {'info':'Friend do not exist'}
            end
        end

        private
        def set_user
            @user = User.find(params[:user_id])
        end

    end
end