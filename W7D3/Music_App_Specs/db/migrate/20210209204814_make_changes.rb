class MakeChanges < ActiveRecord::Migration[5.2]
  def change
    rename_table :create_bands, :bands
  end
end
