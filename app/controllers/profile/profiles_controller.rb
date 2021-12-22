module Profile
  class ProfilesController < ApplicationController
    before_action :authenticate_user!

    def profile

    end
  end
end
