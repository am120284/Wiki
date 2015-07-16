class ArticlesController < ApplicationController
	def index
	end

	def new
		@article = Article.new
	end

	def create
		@article = Article.new(article_params)

		if @article.save
			redirect_to @article
		end
		render 'new'
	end

	private
	def article_params
		params.require(:article).permit(:title, :content)
	end
end
