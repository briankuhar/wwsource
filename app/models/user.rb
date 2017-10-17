class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_one :profile, dependent: :destroy
  has_many :projects, dependent: :destroy
  
  after_create :create_and_associate_profile, on: :create
  

  
  private
  
    def create_and_associate_profile
      self.create_profile
    end
end
