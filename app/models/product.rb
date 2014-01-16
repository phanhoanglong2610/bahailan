class Product < ActiveRecord::Base
  attr_accessible :category_id, :code, :deleted, :file_name, :is_feature, :is_new, :is_sale, :name, :note, :price, :sku, :status, :unit
end
