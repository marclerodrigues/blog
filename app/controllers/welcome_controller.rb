class WelcomeController < ApplicationController
  def index
    @articles = Article.limit(5)
    @users = User.all
  end
end
