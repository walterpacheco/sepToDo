class List < ApplicationRecord
  has_many :completes
  has_many :users, through: :completes

end
