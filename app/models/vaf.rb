# == Schema Information
#
# Table name: vafs
#
#  id                          :integer          not null, primary key
#  user_id                     :integer
#  software_id                 :integer
#  data_communication          :integer          default(0)
#  distributed_data_processing :integer          default(0)
#  performance                 :integer          default(0)
#  heavily_used_configuration  :integer          default(0)
#  transaction_rate            :integer          default(0)
#  online_data_entry           :integer          default(0)
#  end_user_effeciency         :integer          default(0)
#  online_update               :integer          default(0)
#  complex_processing          :integer          default(0)
#  reusability                 :integer          default(0)
#  installation_ease           :integer          default(0)
#  operational_ease            :integer          default(0)
#  multiple_sites              :integer          default(0)
#  facilitate_change           :integer          default(0)
#  created_at                  :datetime
#  updated_at                  :datetime
#

class Vaf < ActiveRecord::Base

  # associations.
  belongs_to :software

end
