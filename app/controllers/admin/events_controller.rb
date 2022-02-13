module Admin
  class EventsController < AdminController
    before_action :set_event
    include ApplicationHelper

    def index
      @events = Event.all
    end

    def new
      @event = Event.new
    end

    def create
      event = Event.new(event_params)
      if event.save
        flash[:success] = "#{formatted_date(event.date)} event has been created"
      else
        flash[:warning] = "An error has occurred please try again"
      end
      redirect_to admin_events_path
    end

    def edit
    end

    def update
      if @event.update(event_params)
        flash[:success] = "#{formatted_date(@event.date)} event has been updated"
      else
        flash[:warning] = "An error has occurred please try again"
      end
      redirect_to admin_events_path
    end

    def destroy
      @event.destroy
      redirect_to admin_events_path
    end

    private

    def event_params
      params.fetch(:event).permit(:date, :start_time, :finish_time)
    end

    def set_event
      @event = Event.find_by(params[:id])
    end
  end
end
