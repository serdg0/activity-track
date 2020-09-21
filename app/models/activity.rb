class Activity < ApplicationRecord
  belongs_to :user
  has_many :entries, dependent: :destroy

  validates :label, presence: true

  def total_minutes
    ((total_time % 3600) / 60).to_i
  end

  def total_hours
    (total_time / 3600).to_i
  end

  def time_display
    if entries.length == 0 || total_time == 0
      "You haven't worked on this activity yet!"
    else
      "Total Time: #{total_hours}H #{total_minutes}M"
    end
  end

  private

  def total_time
    entries.inject(0) do |sum, n|
      sum + n.total_time_in_secs
    end
  end
end
