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

  def new_matrix_common_expense_property
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
      @rent = SubunitRent.new

      @rent.subunit_id = (s[:subunit_id]).to_i
      @rent.amount = (s[:amount]).to_f
      @rent.period = Date.new(params[:period_rents]["(1i)"].to_i, params[:period_rents]["(2i)"].to_i)
      @rent.payed = false

      if @rent.save!
        # create a pdf from a string
        @pdf_string = render_to_string template: "administrators/pdf_rent_charge", layout: "layouts/pdf.html.erb", encoding: "utf-8"

        # When the rent is saved, send mail to renter
        CreatedRentChargeJob.set(wait: 5.seconds).perform_later(@rent.subunit.renter, @rent, @rent.subunit.property, @pdf_string)
      end
    end
  end

  def renter_profile
    renter_id = params[:renter_id]
    @renter = Renter.find(renter_id)
    @subunits = @renter.subunits
  end

  def test_pdf_rent_charge
    @renter = Renter.first
    @property = @renter.subunits.first.property
    @rent = @renter.subunits.first.subunit_rents.first
    @subunit = @rent.subunit
  end

  def test_pdf_common_expense_charge
    @renter = Renter.first
    @property = @renter.subunits.first.property
    @common_expense_property = @property.common_expense_properties.first
    @common_expense_subunit = @common_expense_property.common_expense_subunits.first
    @subunit = @common_expense_subunit.subunit
  end

  def search_id_for_rent_charge
    id = params[:subunit_rent_identifier][:identifier]

    begin
      subunit_rent = SubunitRent.find(id)
    rescue ActiveRecord::RecordNotFound
      render :template => '/administrators/no_rent_found'
      return
    else
      if subunit_rent.payed?
        redirect_to rent_payment_path(subunit_rent.rent_payment.id)
        return
      else
        redirect_to new_rent_payment_path(:subunit_rent_id => subunit_rent.id)
        return
      end
    end

    # if !subunit_rent
    #   render :template => 'no_rent_found.js.erb'
    # end

    # if subunit_rent.payed?
    #   redirect_to rent_payment_path(subunit_rent.rent_payment.id)
    #   return
    # else
    #   redirect_to new_rent_payment_path(:subunit_rent_id => subunit_rent.id)
    #   return
    # end
  end
end
