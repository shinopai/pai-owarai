class Stage < ApplicationRecord
  # validation
  validates :title,
            presence: true,
            length: { maximum: 50 }
  validates :performance_date,
            presence: true
  validates_date :performance_date
  validates_time :starting_time
  validates_time :closing_time
  validates :venue,
            presence: true,
            length: { maximum: 100 }
  validates :price,
            presence: true,
            numericality: {only_integer: true, greater_than_or_equal_to: 0}
  validates :comment,
            length: { maximum: 200 }

  # relation
  belongs_to :user
  has_many :joins
  has_many :comedians, through: :joins
end
