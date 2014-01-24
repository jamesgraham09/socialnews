class StoriesController < ApplicationController

	def new
		@story = Story.new
	end

	def create
		@story = Story.new params[:story].permit(:name, :string, :body, :text)
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
		@story = Story.find(params[:id])
	end

	def update
		@story = Story.find(params[:id])
		if @story.update params[:story].permit(:name, :string, :body, :text)
			redirect_to story_path(@story)
		else
			redirect_to edit_story_path(@story)
		end
	end

	def destroy
		@story = Story.find(params[:id])
		@story.destroy
		redirect_to '/stories'
	end
end
