class CreateEmis < ActiveRecord::Migration[8.0]
  def change
    create_table :emis do |t|
      t.references :loan, null: false, foreign_key: true
      t.date :due_date
      t.decimal :amount
      t.boolean :paid

      t.timestamps
    end
  end
end
