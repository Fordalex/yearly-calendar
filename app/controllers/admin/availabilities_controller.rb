module Admin
  class AvailabilitiesController < AdminController
    before_action :set_availability
    include ApplicationHelper

    def index
      @availabilities = Availability.all
    end

    def new
      @availabilty = Availability.new
    end

    def create
      availability = Availability.new(availability_params)
      if availability.save
        flash[:success] = "#{formatted_date(availability.date)} availability has been created"
      else
        flash[:warning] = "An error has occurred please try again"
      end
      redirect_to admin_root_path
    end

    def edit
    end

    def update
      if @availability.update(availability_params)
        flash[:success] = "#{formatted_date(@availability.date)} availability has been updated"
      else
        flash[:warning] = "An error has occurred please try again"
      end
      redirect_to admin_root_path
    end

    def destroy
      @availability.destroy
      redirect_to admin_root_path
    end

    private

    def availability_params
      params.fetch(:availability).permit(:date, :start_time, :finish_time)
    end

    def set_availability
      @availability = Availability.find_by(params[:id])
    end
  end
end
