class Entry < ApplicationRecord
  belongs_to :user
  belongs_to :activity

  validates :minutes, presence: true, 
             numericality: {only_integer: true, greater_than_or_equal_to: 15}
  validates :date, presence: true

end
  