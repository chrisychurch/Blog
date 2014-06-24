class PostsController < ApplicationController
	def index
		@posts = Post.all
	end
#Main page where posts will be shown 
#Has a view

	def show
		@post = Post.find(params[:id])
	end
#Shows an individual post
#Has a view
# '@' is a instance variable
	
	def new
		@post = Post.new
	end
#Displays a form to create a new post
#Has a view
	
	def create
		@post = Post.create(post_params)

		if @post.save
			redirect_to posts_path, :notice => "Your post was saved"
		else
			render "new"
		end
	end
#Form from 'new' action will submit to, and will save it into the db
	
	def edit
		@post = Post.find(params[:id])
	end
#Displays a form for editing a post

	def update
		@post = Post.find(params[:id])

		if @post.update_attributes(post_params)
			redirect_to posts_path, :notice => "Your Post has been updated"
		else
			render "edit"
		end	
	end
#Used to update the posts form on the edit page

	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		redirect_to posts_path, :notice => "Your post has been deleted"
		

	end
#To delete a post


	private

	def post_params
		params.require(:post).permit(:title,:content)
	end
end
