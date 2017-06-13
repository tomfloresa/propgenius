class Owner < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :properties
  has_many :subunits

  def owner_name_lastname
    "#{self.first_name} #{self.first_last_name}"
  end

  def owner_or_company_or_both
    if self.first_name.blank?
      "#{self.company_name}"
    elsif self.company_name.blank?
      "#{self.first_name} #{self.first_last_name}"
    elsif !self.company_name.blank? && !self.first_name.blank?
      "#{self.company_name} - #{self.owner_name_lastname}"
    end
  end
end
