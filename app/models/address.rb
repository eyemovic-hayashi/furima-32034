class Address < ApplicationRecord
  belongs_to :from_area
  belongs_to :purchase
end
