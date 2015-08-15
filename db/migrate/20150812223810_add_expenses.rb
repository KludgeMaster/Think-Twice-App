class AddExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.integer :user_id
      t.string :name
      t.string :category
      t.integer :value
      t.string :interval
    end
  end
end
