class EventsController < ApplicationController
	before_action :get_user, only: [:create_event, :edit, :update]

	def create_event
		@event = Event.new(event_params)
		if @event.save
			flash[:notice] = "Event has been created"
			redirect_to :back
		end
	end

	def edit
		@event = Event.find(params[:id])
		render :template => "users/_event_form"
	end

	def update
		@event = Event.find(params[:id])
		if @event.present?
			@event.update_attributes(event_params)
			flash[:notice] = "Event updated successfully"
			redirect_to users_path
		end
	end

	private
	def get_user
		@user = User.find_by_id(session[:id])
	end

	def event_params
		params.require(:event).permit(:name, :location, :user_id)
	end

end
