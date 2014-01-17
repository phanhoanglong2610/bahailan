class ContactsController < ApplicationController
  active_scaffold :"contact" do |conf|

    conf.label = "Contacts"
    #conf.columns = [:name, :phone, :mobile, :email, :yahoo]
    #list.columns.exclude :comments
    list.sorting = {:name => 'ASC'}
    columns[:phone].label = "Phone #"
    columns[:phone].description = "(Format: ###-###-####)"

    conf.columns[:status].form_ui = :select
    conf.columns[:status].options = {:options => WebConstant::STATUSES }
  end
end
