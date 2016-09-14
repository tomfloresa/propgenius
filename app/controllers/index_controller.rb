class IndexController < ApplicationController
  def index
    #code
  end

  def new_subunit_for_property
    @subunit = Subunit.new
    @property = Property.find(params[:property_id])
  end
end
