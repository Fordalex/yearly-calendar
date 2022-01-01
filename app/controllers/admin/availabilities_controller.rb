module Admin
  class AvailabilitiesController < AdminController
    before_action :set_availability

    def index
      @availabilities = Availability.all
    end

    def new
      @availabilty = Availability.new
    end

    def edit
    end

    def update
    end

    def destroy
    end

    private

    def set_availability
      @availability = Availability.find_by(params[:id])
    end
  end
end
