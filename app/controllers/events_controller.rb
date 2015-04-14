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

	def show_done
		
	 @events = Event.all.where(:is_done => true)
		
	end
	
	def show_undone
	
		@events = Event.all.where(:is_done => false)
	end
	
	
	def create
		@event = Event.new(event_params)
		@event.is_done = false
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
