class Project < ApplicationRecord
  belongs_to :user
  has_many :materials, dependent: :destroy
  accepts_nested_attributes_for :materials, :allow_destroy => true
  
  validates_format_of :youtube_link, :with => URI.regexp(['https://www.youtube.com/watch?'])

end
