class Renter < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :properties
  has_many :subunits

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def renter_name_lastname
    "#{self.first_name} #{self.first_last_name}"
  end
end
