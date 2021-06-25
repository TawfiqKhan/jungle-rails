class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.string :title
      t.string :starts_on
      t.string :date
      t.string :ends_on
      t.string :date
      t.integer :percent_off

      t.timestamps null: false
    end
  end
end
