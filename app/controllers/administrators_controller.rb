class AdministratorsController < ApplicationController
  def dashboard
    @properties = Property.all
    @subunits = Subunit.all
    @owners = Owner.all
    @renters = Renter.all
    @uf = ImportantNumericalValue.find(1)
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
    # Rescue the hash with all the rents generated for property's subunits
    subunit_rents = params[:subunit_rents]
    period_rents = params[:period_rents]

    # Iterate through each of the elements of the array
    subunit_rents.each do |s|
      rent = SubunitRent.new

      rent.subunit_id = (s[:subunit_id]).to_i
      rent.amount = (s[:amount]).to_f
      rent.period = Date.new(params[:period_rents]["(1i)"].to_i, params[:period_rents]["(2i)"].to_i)
      rent.payed = false

      if rent.save!
        # When the rent is saved, send mail to renter
        ## CreatedRentChargeJob.set(wait: 5.seconds).perform_later(s.subunit.renter, rent, s.subunit.property)
      end
    end
  end

  def renter_profile
    renter_id = params[:renter_id]
    @renter = Renter.find(renter_id)
    @subunits = @renter.subunits
  end
end
