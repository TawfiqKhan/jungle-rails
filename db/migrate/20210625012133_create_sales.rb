class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.string :title
      t.date :starts_on
      t.date :ends_on
      t.integer :percent_off

      t.timestamps null: false
    end
  end
end
