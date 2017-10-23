class Project < ApplicationRecord
  belongs_to :user
  has_many :materials, dependent: :destroy
  accepts_nested_attributes_for :materials, :allow_destroy => true

end
