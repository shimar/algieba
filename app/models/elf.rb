# == Schema Information
#
# Table name: data_functions
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  software_id  :integer
#  type         :string(255)
#  det          :integer
#  ret          :integer
#  lock_version :integer
#  created_at   :datetime
#  updated_at   :datetime
#  name         :string(255)
#

class Elf < DataFunction

  @@function_points = {
    low:      5,
    average:  7,
    high:    10
  }.freeze

  def function_point
    @@function_points[complexity]
  end

end
