class Contact < ActiveRecord::Base
  attr_accessible :address, :city, :deleted, :description, :email, :mobile, :name, :note, :phone, :skype, :status, :type, :yahoo
end
