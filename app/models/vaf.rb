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

  # this values based on a pdf following:
  #   https://cs.uwaterloo.ca/~apidduck/CS846/Seminars/abbas.pdf
  @@degree_of_influences = {
    no_influence: 0,
    incidental:   1,
    moderate:     2,
    average:      3,
    significant:  4,
    essential:    5,
  }.freeze

  # associations.
  belongs_to :software

  # validations.
  validates :user_id,
  presence: true

  validates :software_id,
  presence: true

  validates :data_communication,
  inclusion: { in: @@degree_of_influences.values }

  validates :distributed_data_processing,
  inclusion: { in: @@degree_of_influences.values }

  validates :performance,
  inclusion: { in: @@degree_of_influences.values }

  validates :heavily_used_configuration,
  inclusion: { in: @@degree_of_influences.values }

  validates :transaction_rate,
  inclusion: { in: @@degree_of_influences.values }

  validates :online_data_entry,
  inclusion: { in: @@degree_of_influences.values }

  validates :end_user_effeciency,
  inclusion: { in: @@degree_of_influences.values }

  validates :online_update,
  inclusion: { in: @@degree_of_influences.values }

  validates :complex_processing,
  inclusion: { in: @@degree_of_influences.values }

  validates :reusability,
  inclusion: { in: @@degree_of_influences.values }

  validates :installation_ease,
  inclusion: { in: @@degree_of_influences.values }

  validates :operational_ease,
  inclusion: { in: @@degree_of_influences.values }

  validates :multiple_sites,
  inclusion: { in: @@degree_of_influences.values }

  validates :facilitate_change,
  inclusion: { in: @@degree_of_influences.values }

  def total_degree_of_influences
    tdi = 0
    [data_communication,
      distributed_data_processing,
      performance,
      heavily_used_configuration,
      transaction_rate,
      online_data_entry,
      end_user_effeciency,
      online_update,
      complex_processing,
      reusability,
      installation_ease,
      operational_ease,
      multiple_sites,
      facilitate_change].each { |e| tdi += e }
    return tdi
  end
  alias_method :tdi, :total_degree_of_influences

  def self.degree_of_influences
    @@degree_of_influences
  end

end
