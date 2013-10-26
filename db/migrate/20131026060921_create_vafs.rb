class CreateVafs < ActiveRecord::Migration
  def change
    create_table :vafs do |t|
      t.integer :user_id
      t.integer :software_id
      t.integer :data_communication, default: 0
      t.integer :distributed_data_processing, default: 0
      t.integer :performance, default: 0
      t.integer :heavily_used_configuration, default: 0
      t.integer :transaction_rate, default: 0
      t.integer :online_data_entry, default: 0
      t.integer :end_user_effeciency, default: 0
      t.integer :online_update, default: 0
      t.integer :complex_processing, default: 0
      t.integer :reusability, default: 0
      t.integer :installation_ease, default: 0
      t.integer :operational_ease, default: 0
      t.integer :multiple_sites, default: 0
      t.integer :facilitate_change, default: 0

      t.timestamps
    end
  end
end
