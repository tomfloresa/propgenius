module TransversalsHelper
  def show_navbar
    if administrator_signed_in?
      render('transversals/navbar_admin')
    else
      if renter_signed_in?
        render('transversals/navbar_renter')
      end
    end
  end
end
