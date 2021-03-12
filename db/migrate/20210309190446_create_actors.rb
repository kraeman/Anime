class CreateActors < ActiveRecord::Migration[6.1]
  def change
    create_table :actors do |t|
      t.string :name
      t.integer :years_active

      t.timestamps
    end
  end
end
