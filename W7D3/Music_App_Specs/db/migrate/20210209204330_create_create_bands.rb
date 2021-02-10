class CreateCreateBands < ActiveRecord::Migration[5.2]
  def change
    create_table :create_bands do |t|
      t.string :name, null: false

      t.timestamps
    end
  end
end
