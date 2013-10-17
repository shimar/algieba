class AddNameToDataFunctions < ActiveRecord::Migration
  def change
    add_column :data_functions, :name, :string
  end
end
