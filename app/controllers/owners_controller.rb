class OwnersController < ApplicationController
  before_action :authenticate_owner!
  def dashboard
    ## Get all subunits for current owner
    @subunits = current_owner.subunits

    ## Get all properties holding those subunits
    @properties = current_owner.subunits.pluck(:property_id).uniq

    ## Get all unpayed subunit_rents
    subunits = current_owner.subunits

    subunits.each do |s|
      @subunits_debts = SubunitRent.where(subunit_id: s.id).where(payed: false)
    end
  end

  def index
    @owners = owner.all
  end

  def subunits_for_owner
    @subunits = current_owner.subunits
  end

  def properties_for_owner
    # Create an array to hold new property records
    @properties = Array.new

    # Loop through the array to get each subunit's property
    current_owner.subunits.each do |s|
      @properties << s.property
    end

    # Delete possible duplicates coming from the loop
    @properties.uniq!
  end
end
