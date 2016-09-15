class IndexController < ApplicationController
  def index
    # Depending on the tipe of user signed_id, redirect to it's dashboard
    if administrator_signed_in?
      redirect_to administrators_dashboard_path
    end
  end
end
