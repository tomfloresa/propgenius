class RentersController < ApplicationController
  before_action :authenticate_renter!
  def dashboard
    ## Get all subunits for current renter
    @subunits = current_renter.subunits

    ## Get all properties holding those subunits
    @properties = current_renter.subunits.pluck(:property_id).uniq

    ## Get all unpayed subunit_rents
    subunits = current_renter.subunits

    subunits.each do |s|
      @subunits_debts = SubunitRent.where(subunit_id: s.id).where(payed: false)
    end
  end

  def index
    @renters = Renter.all
  end

  def subunits_for_renter
    @subunits = current_renter.subunits
  end

  def properties_for_renter
    # Create an array to hold new property records
    @properties = Array.new

    # Loop through the array to get each subunit's property
    current_renter.subunits.each do |s|
      @properties << s.property
    end

    # Delete possible duplicates coming from the loop
    @properties.uniq!
  end
end
