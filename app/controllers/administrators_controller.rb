class AdministratorsController < ApplicationController
  def dashboard
    @properties = Property.all
    @owners = Owner.all
    @renters = Renter.all
  end

  def new_subunit_for_property
    @subunit = Subunit.new
    @property = Property.find(params[:property_id])
  end

  def new_matrix_common_expese_property
    @common_expense_property = CommonExpenseProperty.new
    @property = Property.find(params[:property_id])
  end
end
