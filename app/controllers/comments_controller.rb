class CommentsController < ApplicationController
  def create
    @article = current_user.articles.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    redirect_to user_article_path(current_user.id, @article)
  end

  def destroy
    @article = current_user.articles.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to user_article_path(current_user.id, @article)
  end

  private

  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end
end
