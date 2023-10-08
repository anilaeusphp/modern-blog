class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user

  has_rich_text :body

  after_create_commit :notify_recipient
  before_destroy :cleanup_notifications
  has_noticed_notifications model_name: "Notification"


  private
  def notify_recipient
    
  end

  private
  def cleanup_notifications
    notifications_as_comment.destroy_all # destroy any notification associated with this comment.
  end
end
