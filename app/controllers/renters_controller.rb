class RentersController < ApplicationController
  def dashboard
    ## Get all subunits for current renter
    @subunits = current_renter.subunits

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
