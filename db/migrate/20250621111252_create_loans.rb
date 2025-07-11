class CreateLoans < ActiveRecord::Migration[8.0]
  def change
    create_table :loans do |t|
      t.references :user, null: false, foreign_key: true
      t.decimal :amount
      t.string :status
      t.integer :duration

      t.timestamps
    end
  end
end
