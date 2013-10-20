# == Schema Information
#
# Table name: transactional_functions
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  software_id  :integer
#  name         :string(255)
#  type         :string(255)
#  det          :integer
#  ftr          :integer
#  lock_version :integer
#  created_at   :datetime
#  updated_at   :datetime
#

class TransactionalFunction < ActiveRecord::Base

  # associations.
  belongs_to :software

  # validations.
  validates :user_id,
  presence: true

  validates :software_id,
  presence: true

  validates :name,
  presence: true,
  length: { maximum: 255, allow_blank: true }

  validates :type,
  presence: true

  validates :det,
  numericality: { only_integer: true,
    greater_than_or_equal_to: 0 }

  validates :ftr,
  numericality: { only_integer: true,
    greater_than_or_equal_to: 0 }

end
