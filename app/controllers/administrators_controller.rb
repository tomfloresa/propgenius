class AdministratorsController < ApplicationController
    before_action :authenticate_administrator!
    def dashboard
        @properties = Property.all
        @subunits = Subunit.all
        @owners = Owner.all
        @renters = Renter.all
        @uf = ImportantNumericalValue.find(1)

        ## Get all subunits due to end lease within next three months
        @subunits_end_lease = Subunit.where('readjustment_date < ?', 3.month.from_now).order(readjustment_date: :asc)
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
        # Get UF value in case needed
        @uf = ImportantNumericalValue.find(1).value
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
            @rent.period = Date.new(params[:period_rents]['(1i)'].to_i, params[:period_rents]['(2i)'].to_i)
            @rent.payed = false

            next unless @rent.save!
            # create a pdf from a string
            @pdf_string = render_to_string template: 'administrators/pdf_rent_charge', layout: 'layouts/pdf.html.erb', encoding: 'utf-8'

            # When the rent is saved, send mail to renter
            CreatedRentChargeJob.set(wait: 5.seconds).perform_later(@rent.subunit.renter, @rent, @rent.subunit.property, @pdf_string)
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

    def test_pdf_rent_receipt
      @rent_payment = RentPayment.first
      @subunit_rent = @rent_payment.subunit_rent
      @subunit = @rent_payment.subunit
      @property = @subunit.property
      @renter = @subunit.renter
      @qrcode = RQRCode::QRCode.new("http://github.com/").as_html
    end

    def search_id_for_rent_charge
        id = params[:subunit_rent_identifier][:identifier]

        begin
            subunit_rent = SubunitRent.find(id)
        rescue ActiveRecord::RecordNotFound
            render template: '/administrators/no_rent_found'
            return
        else
            if subunit_rent.payed?
                redirect_to rent_payment_path(subunit_rent.rent_payment.id)
                return
            else
                redirect_to new_rent_payment_path(subunit_rent_id: subunit_rent.id)
                return
            end
        end
    end

    def search_id_for_common_expense_subunit
        id = params[:common_expense_subunit_identifier][:identifier]

        begin
            common_expense_subunit = CommonExpenseSubunit.find(id)
        rescue ActiveRecord::RecordNotFound
            render template: '/administrators/no_rent_found'
            return
        else
            if common_expense_subunit.payed?
                redirect_to common_expense_payment_path(common_expense_subunit.common_expense_payment.id)
                return
            else
                redirect_to new_common_expense_payment_path(common_expense_subunit_id: common_expense_subunit.id)
                return
            end
        end
    end

    def check_if_common_expense_property_for_period_is_issued
      year = params[:year]
      month = params[:month]
      property_id = params[:property_id]

      date_to_be_found = Date.new(year.to_i, month.to_i, 1)

      @common_expense_property = CommonExpenseProperty.find_by(period: date_to_be_found, property_id: property_id)

      respond_to do |format|
        format.js
      end
    end

    def edit_renter_profile
      @renter =  Renter.find(params[:id])
    end

    def edit_owner_profile
      @owner =  Owner.find(params[:id])
    end

    def update_renter_registry
      @renter = Renter.find(params[:renter_id])

      @renter.company_name != params[:renter][:company_name] ? @renter.company_name = params[:renter][:company_name] : ''
      @renter.renter_rut != params[:renter][:renter_rut] ? @renter.renter_rut = params[:renter][:renter_rut] : ''
      @renter.first_name != params[:renter][:first_name] ? @renter.first_name = params[:renter][:first_name] : ''
      @renter.second_name != params[:renter][:second_name] ? @renter.second_name = params[:renter][:second_name] : ''
      @renter.first_last_name != params[:renter][:first_last_name] ? @renter.first_last_name = params[:renter][:first_last_name] : ''
      @renter.second_last_name != params[:renter][:second_last_name] ? @renter.second_last_name = params[:renter][:second_last_name] : ''
      @renter.email != params[:renter][:email] ? @renter.email = params[:renter][:email] : ''
      @renter.mobile != params[:renter][:mobile] ? @renter.mobile = params[:renter][:mobile] : ''
      @renter.landline != params[:renter][:landline] ? @renter.landline = params[:renter][:landline] : ''
      @renter.password != params[:renter][:password_confirmation] ? @renter.password = params[:renter][:password_confirmation] : ''

      if @renter.save
        redirect_to administrators_dashboard_path
      end
    end

    def update_owner_registry
      @owner = Owner.find(params[:owner_id])

      @owner.company_name != params[:owner][:company_name] ? @owner.company_name = params[:owner][:company_name] : ''
      @owner.owner_rut != params[:owner][:owner_rut] ? @owner.owner_rut = params[:owner][:owner_rut] : ''
      @owner.first_name != params[:owner][:first_name] ? @owner.first_name = params[:owner][:first_name] : ''
      @owner.second_name != params[:owner][:second_name] ? @owner.second_name = params[:owner][:second_name] : ''
      @owner.first_last_name != params[:owner][:first_last_name] ? @owner.first_last_name = params[:owner][:first_last_name] : ''
      @owner.second_last_name != params[:owner][:second_last_name] ? @owner.second_last_name = params[:owner][:second_last_name] : ''
      @owner.email != params[:owner][:email] ? @owner.email = params[:owner][:email] : ''
      @owner.mobile != params[:owner][:mobile] ? @owner.mobile = params[:owner][:mobile] : ''
      @owner.landline != params[:owner][:landline] ? @owner.landline = params[:owner][:landline] : ''
      @owner.password != params[:owner][:password_confirmation] ? @owner.password = params[:owner][:password_confirmation] : ''

      if @owner.save
        redirect_to administrators_dashboard_path
      end
    end
end
