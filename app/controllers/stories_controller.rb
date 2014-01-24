class StoriesController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]

	def new
		@story = Story.new
	end

	def create
		@story = Story.new params[:story].permit(:name, :string, :body, :text)
		@story.user = current_user
		if @story.save
			redirect_to story_path(@story)
		else
			redirect_to new_story_path
		end
	end

	def index
		@stories = Story.all
	end

	def show
		@story = Story.find(params[:id])
	end

	def edit
		@story = current_user.stories.find(params[:id])
	end

	def update
		@story = current_user.stories.find(params[:id])
		if @story.update params[:story].permit(:name, :string, :body, :text)
			redirect_to story_path(@story)
		else
			redirect_to edit_story_path(@story)
		end
	end

	def destroy
		@story = current_user.stories.find(params[:id])
		@story.destroy
		redirect_to '/stories'
	end
end
