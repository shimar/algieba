class AddMeasureMethodToSoftware < ActiveRecord::Migration
  def change
    add_column :softwares, :measure_method, :integer
  end
end
