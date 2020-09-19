class Activity < ApplicationRecord
  belongs_to :user
  has_many :entries, dependent: :destroy

  validates :label, uniqueness: true, presence: true
end
