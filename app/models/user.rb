class User < ApplicationRecord
  has_many :projects
  enum user_type: {
    manager: 0,
    qa: 1,
    developer: 2
  }
  # enum user_type: [:manager, :developer, :qa]
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
