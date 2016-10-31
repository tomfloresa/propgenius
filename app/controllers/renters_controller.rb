class RentersController < ApplicationController
  def dashboard
    #code
  end

  def index
    @renters = Renter.all
  end
end
