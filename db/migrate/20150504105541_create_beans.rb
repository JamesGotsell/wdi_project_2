class CreateBeans < ActiveRecord::Migration
  def change
    create_table :beans do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
