class SearchController < ApplicationController
  def index
    def set_query
      if params[:q]
        @q = Post.ransack(params[:q])
        @posts = @q.result

      else
        @q = Post.ransack({})
        @posts = Post.all
      end
    end
  end

 
  
end
