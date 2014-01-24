class VotesController < ApplicationController

	def new
		# @story = stories.find(params[:id])
		@vote = Vote.new
	end

	def create
		# @story = stories.find(params[:id])
		@vote = Vote.new(params[:vote].permit(:integer))
		@vote.story_id = @story.id
		@vote.user = current_user

		@vote.save
	end

end
