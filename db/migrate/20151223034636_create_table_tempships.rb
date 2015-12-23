class CreateTableTempships < ActiveRecord::Migration
  def change
    create_table :table_tempships do |t|
      t.integer :user_id
      t.integer :temp_id
      t.timestamps null: false
    end
  end
end
