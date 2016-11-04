class Renter < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :properties
  has_many :subunits
  has_many :rent_payments
  has_many :common_expense_payments

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def renter_name_lastname
    "#{self.first_name} #{self.first_last_name}"
  end
end
