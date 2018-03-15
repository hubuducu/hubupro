class CreateEntries < ActiveRecord::Migration[5.1]
  def change
    create_table :entries do |t|
      t.string :idparcel
      t.string :name
      t.timestamps
    end
  end
end
