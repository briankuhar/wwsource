class Project < ApplicationRecord
  belongs_to :user
  has_many :materials
  accepts_nested_attributes_for :materials

end
