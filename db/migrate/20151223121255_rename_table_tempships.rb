class RenameTableTempships < ActiveRecord::Migration
  def change
    rename_table :table_tempships, :tempships
  end
end
