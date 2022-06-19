class Comedian < ApplicationRecord
  # validation
  validates :stage_name,
            presence: true,
            length: { maximum: 50 }
  validates :comment,
            presence: true,
            length: { maximum: 200 }

  # relation
  belongs_to :user, optional: true
  belongs_to :genre
  has_one_attached :image
  has_many :joins
  has_many :stages, through: :joins
end
