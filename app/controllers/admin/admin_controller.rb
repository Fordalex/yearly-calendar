module Admin
  class AdminController < ApplicationController
    before_action :logout_regular_user!
    before_action :authenticate_administrator!
    layout "admin"

    private

    def logout_regular_user!
      if user_signed_in?
        reset_session
        redirect_to new_administrator_session_path
      end
    end
  end
end
