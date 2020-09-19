class Entry < ApplicationRecord
  belongs_to :user
  belongs_to :activity

  validates :minutes, presence: true, length: { minimum: 15 }
end
  