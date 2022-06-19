class Join < ApplicationRecord
  # relation
  belongs_to :comedian
  belongs_to :stage

  # validation
  validates :comedian_id, uniqueness: { scope: :stage_id }
end
