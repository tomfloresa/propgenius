class RentersController < ApplicationController
  before_action :authenticate_renter!
  def dashboard
    ## Get all subunits for current renter
    @subunits = current_renter.subunits

    ## Get all properties holding those subunits
    @properties = current_renter.subunits.pluck(:property_id).uniq!

    ## Get all unpayed subunit_rents
    subunits = current_renter.subunits

    subunits.each do |s|
      @subunits_debts = SubunitRent.where(subunit_id: s.id).where(payed: false)
    end
  end

  def index
    @renters = Renter.all
  end
end
