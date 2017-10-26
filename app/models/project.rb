class Project < ApplicationRecord
  belongs_to :user
  has_many :materials, dependent: :destroy
  accepts_nested_attributes_for :materials, :allow_destroy => true
  
  validates_format_of :youtube_link, :allow_blank => true, :with => /(^$)|(^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$)/ix

  def self.search(search)
    where("project_name ILIKE ? OR project_description ILIKE ?", "%#{search}%", "%#{search}%")
  end
  
end
