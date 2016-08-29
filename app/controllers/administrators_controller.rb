class AdministratorsController < ApplicationController
  def dashboard
    @properties = Property.all
    @owners = Owner.all
    @renters = Renter.all
  end
end
