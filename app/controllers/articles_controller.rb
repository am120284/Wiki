class ArticlesController < ApplicationController
	before_action :find_article, only: [:show, :edit, :update, :destroy]

	#if a user who isnt signed in tries to created a new article he/she will be routed back to the home page
	before_action :authenticate_user!, except: [:index, :show]

	def index
		if params[:category].blank?
			@articles = Article.all.order("created_at DESC")
		else
			@category_id = Category.find_by(name: params[:category]).id
			@articles    = Article.where(category_id: @category_id).order("created_at DESC")
		end
	end

	def show
		@article = Article.find(params[:id])
	end

	def new
		@article = current_user.articles.build
	end

	def create
		@article = current_user.articles.build(article_params)

		if @article.save
			redirect_to @article
	
		else
			render 'new'
		end
	end

	def edit
		@article = Article.find(params[:id])
	end

	def update
		@article = Article.find(params[:id])
		if @article.update(article_params)
			redirect_to @article
		else
			render 'edit'
		end
	end

	def destroy
		@article = Article.find(params[:id])
		@article.destroy
		redirect_to root_path
	end


	private

	def find_article
	end

	def article_params
		params.require(:article).permit(:title, :content, :category_id)
	end
end
