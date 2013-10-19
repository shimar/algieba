# == Schema Information
#
# Table name: softwares
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  name        :string(255)
#  description :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

class Software < ActiveRecord::Base

  # associations.
  has_many :data_functions
  has_many :ilfs
  has_many :elfs

  accepts_nested_attributes_for :data_functions, allow_destroy: true

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
