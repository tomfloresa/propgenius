class NotificationsForEndings < ApplicationMailer
  default from: "hola@valprop.propgenius.cl"

  def mailer_for_thirty_days(subunit_id)
    @subunit = Subunit.find(subunit_id.to_i)

    mail(to: @subunit.renter.email, subject: "Notificación de Expiración de Arriendo - 30 días")
  end

  def mailer_for_fifteen_days(subunit_id)
    @subunit = Subunit.find(subunit_id.to_i)

    mail(to: @subunit.renter.email, subject: "Notificación de Expiración de Arriendo - 15 días")
  end

  def mailer_for_five_days(subunit_id)
    @subunit = Subunit.find(subunit_id.to_i)

    mail(to: @subunit.renter.email, subject: "Notificación de Expiración de Arriendo - 5 días")
  end

  def mailer_for_one_day(subunit_id)
    @subunit = Subunit.find(subunit_id.to_i)

    mail(to: @subunit.renter.email, subject: "Notificación de Expiración de Arriendo - 1 día")
  end
end
