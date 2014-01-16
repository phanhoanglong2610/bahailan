class BookTour < ActiveRecord::Base
  attr_accessible :attendes, :cust_email, :cust_mobile, :cust_name, :cust_phone, :date_slot, :deleted, :description, :note, :status, :time_slot, :tour_code
end
