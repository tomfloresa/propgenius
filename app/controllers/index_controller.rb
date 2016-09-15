class IndexController < ApplicationController
  def index
    # Depending on the tipe of user signed_id, redirect to it's dashboard
    if administrator_signed_in?
      redirect_to administrators_dashboard_path
    end
  end

  def new_subunit_for_property
    @subunit = Subunit.new
    @property = Property.find(params[:property_id])
  end
end
