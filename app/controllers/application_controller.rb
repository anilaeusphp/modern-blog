class ApplicationController < ActionController::Base
    before_action :set_notifications, if: -> { current_user }
    before_action :set_query

    
    private
    def set_notifications
        @notifications = Notification.where(recipient: current_user).newest_first
        @read = @notifications.read.limit(9)
        @unread = @notifications.unread.limit(9)
    end


    def set_query
        @q = Post.ransack(params[:q])
    end
    
end
