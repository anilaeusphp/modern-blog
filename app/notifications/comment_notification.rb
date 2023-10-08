# To deliver this notification:
#
# CommentNotification.with(post: @post).deliver_later(current_user)
# CommentNotification.with(post: @post).deliver(current_user)

class CommentNotification < Noticed::Base
  # Add your delivery methods
  #
  deliver_by :database
  # deliver_by :email, mailer: "UserMailer"
  # deliver_by :slack
  # deliver_by :custom, class: "MyDeliveryMethod"

  # Add required params
  #
  # param :post

  # Define helper methods to make rendering easier.
  #
  def message
    @post = Post.find(params[:comment][:post_id])
    @user = User.find(params[:comment][:user_id])
    @comment = Comment.find(params[:comment][:id])
    "#{@user.email} has comment on #{@post.title.truncate_words(10)}"
  end
  #
  def url
    post_path(params[:post])
  end
end
