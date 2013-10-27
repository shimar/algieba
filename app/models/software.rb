# == Schema Information
#
# Table name: softwares
#
#  id             :integer          not null, primary key
#  user_id        :integer
#  name           :string(255)
#  description    :string(255)
#  created_at     :datetime
#  updated_at     :datetime
#  measure_method :integer          default(0)
#

class Software < ActiveRecord::Base

  # measure_methods.
  @@measure_methods = {
    scratch:     0,
    enhancement: 1,
    application: 2,
  }.freeze

  # associations.
  has_many :data_functions
  has_many :ilfs
  has_many :elfs

  accepts_nested_attributes_for :data_functions,
  allow_destroy: true

  has_many :transactional_functions
  has_many :eis
  has_many :eos
  has_many :eqs

  accepts_nested_attributes_for :transactional_functions,
  allow_destroy: true

  has_one :vaf
  accepts_nested_attributes_for :vaf

  # validations.
  validates :user_id,
  presence: true

  validates :name,
  presence: true,
  length: { maximum: 100 },
  uniqueness: { scope: :user_id }

  validates :description,
  length: { maximum: 255 }

  validates :measure_method,
  presence: true,
  inclusion: { in: @@measure_methods.values }

  def data_function_points
    fp = 0
    [:ilfs, :elfs].each do |association|
      send(association).each { |a| fp += a.function_point }
    end
    return fp
  end

  def transactional_function_points
    fp = 0
    [:eis, :eos, :eqs].each do |association|
      send(association).each { |a| fp += a.function_point }
    end
    return fp
  end

  def unadjusted_function_points
    return data_function_points + transactional_function_points
  end
  alias_method :ufp, :unadjusted_function_points

  def self.measure_methods
    @@measure_methods
  end

end
