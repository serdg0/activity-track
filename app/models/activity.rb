class Activity < ApplicationRecord
  belongs_to :user
  has_many :entries

  validates :label, uniqueness: true, presence: true
end
