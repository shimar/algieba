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

class Ilf < DataFunction

  @@function_points = {
    low:     7,
    average: 10,
    high:    15
  }.freeze

  def function_point
    @@function_points[complexity]
  end

end
