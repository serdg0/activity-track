class Entry < ApplicationRecord
  belongs_to :user
  belongs_to :activity

  validates :from_time, presence: true
  validates :to_time, presence: true
  validates :date, presence: true

end
  