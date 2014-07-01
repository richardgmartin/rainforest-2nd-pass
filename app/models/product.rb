class Product < ActiveRecord::Base
	validates :name, :description, :image_url, presence: true
	validates :price_in_cents, :numericality => {:only_integer => true}
end
