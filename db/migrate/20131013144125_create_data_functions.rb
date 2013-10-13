class CreateDataFunctions < ActiveRecord::Migration
  def change
    create_table :data_functions do |t|
      t.integer :user_id
      t.integer :software_id
      t.string :type
      t.integer :det
      t.integer :ret
      t.integer :lock_version

      t.timestamps
    end
  end
end
