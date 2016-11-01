class AdministratorsController < ApplicationController
  def dashboard
    @properties = Property.all
    @subunits = Subunit.all
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

  def rent_for_subunits
    @property = Property.find(params[:property_id])
    @subunits = @property.subunits.order(number: :asc)
  end

  def create_rent_for_subunits
    # Rescue the hash wil all the rents generated for property's subunits
    subunit_rents = params[:subunit_rents]

    # Iterate through each of the elements of the array
    subunit_rents.each do |s|
      rent = SubunitRent.new

      rent.subunit_id = (s[:subunit_id]).to_i
      rent.amount = (s[:amount]).to_f
      rent.payed = false

      if rent.save!

      end
    end
  end
end
