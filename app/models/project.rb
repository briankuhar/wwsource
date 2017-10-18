class Project < ApplicationRecord
  belongs_to :user
  has_many :materials
  has_many :steps
  accepts_nested_attributes_for :materials, :allow_destroy => true
  accepts_nested_attributes_for :steps, :allow_destroy => true

end
