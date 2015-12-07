class PostsController < ApplicationController
	before_action :authenticate_user!

	def create
		@post = current_user.posts.build(post_params)
		if @post.save
			redirect_to root_url
		else
			render 'static_pages/home'
		end
	end

	private
		def post_params
			params.require(:post).permit(:content)
		end

end
