class ChangeColumnDefault < ActiveRecord::Migration
  def change
    change_column_default :escapades, :image, nil
  end
end
