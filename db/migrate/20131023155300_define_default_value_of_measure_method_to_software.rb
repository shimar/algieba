class DefineDefaultValueOfMeasureMethodToSoftware < ActiveRecord::Migration
  def change
    change_column :softwares, :measure_method, :integer, default: 0
  end
end
