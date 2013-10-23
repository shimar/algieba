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

class Eq < TransactionalFunction

  @@function_points = {
    low:     3,
    average: 4,
    high:    6,
  }.freeze

  def function_point
    @@function_points[complexity]
  end

end
