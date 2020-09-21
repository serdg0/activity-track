class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable

  has_many :activities
  has_many :entries, through: :activities

  validates :name, presence: true, length: { minimum: 2, maximum: 20 }
end
