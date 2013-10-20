class CreateTransactionalFunctions < ActiveRecord::Migration
  def change
    create_table :transactional_functions do |t|
      t.integer :user_id
      t.integer :software_id
      t.string :name
      t.string :type
      t.integer :det
      t.integer :ftr
      t.integer :lock_version

      t.timestamps
    end
  end
end
