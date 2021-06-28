class Project < ApplicationRecord
  has_many :project_qas, dependent: :destroy
  has_many :qas, through: :project_qas, source: :user

  accepts_nested_attributes_for :project_qas, allow_destroy: true
  
  has_many :project_devs, dependent: :destroy
  has_many :devs, through: :project_devs, source: :user
  
  accepts_nested_attributes_for :project_devs, allow_destroy: true
  
  has_many :bugs, dependent: :destroy


  belongs_to :created_by, class_name: "User"
  
  validates :name, presence: true
  validates :description, presence: true
end
