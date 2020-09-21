class Entry < ApplicationRecord
  belongs_to :user
  belongs_to :activity

  validates :from_time, presence: true
  validates :to_time, presence: true
  validates :date, presence: true
  validate :valid_date?, if: :date

  def minutes
    ((total_time_in_secs % 3600) / 60).to_i
  end

  def hours
    (total_time_in_secs / 3600).to_i
  end

  def total_time_in_secs
    to_time - from_time
  end

  private
  
  def valid_date?
    errors.add("Date", "can't be from the future!") unless date <= Time.now
  end
end
