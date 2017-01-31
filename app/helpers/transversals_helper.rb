module TransversalsHelper
  def show_navbar
    if administrator_signed_in?
      render('transversals/navbar_admin')
    elsif renter_signed_in?
      render('transversals/navbar_renter')
    elsif owner_signed_in?
      render('transversals/navbar_owner')
    end
  end
end
