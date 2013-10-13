class Software < ActiveRecord::Base

  # associations.
  has_many :data_functions
  has_many :ilfs
  has_many :elfs

  # validations.
  validates :user_id,
  presence: true

  validates :name,
  presence: true,
  length: { maximum: 100 },
  uniqueness: { scope: :user_id }

  validates :description,
  length: { maximum: 255 }

end
