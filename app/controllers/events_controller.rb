class EventsController < ApplicationController
	def index
		@events = Event.all
		@e = Event.new
	end

	def edit
		@event = Event.find(params[:id])
	end

	def update
		@event = Event.find(params[:id])
		@event.update(event_params)

		redirect_to :action => :index
	end

	def show
		if params[:is_done].present?
		@courses = @courses.where("is_done"
	end

	def create
		@event = Event.new(event_params)
		@event.is_done = true
		@event.save

		redirect_to :action => :index
	end

	def change
		@event = Event.find(params[:id])

		if @event.is_done == true
			@event.is_done = false
		
		elsif @event.is_done == false
			@event.is_done = true
		end
		
		@event.save

		redirect_to :action => :index
	end

	def destroy
		@event = Event.find(params[:id])
		@event.destroy

		redirect_to :action => :index
	end
	
	private

	def event_params
		params.require(:event).permit(:name, :is_done)
	end

end
