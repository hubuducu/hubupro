class CreateEntries < ActiveRecord::Migration[5.1]
  def change
    create_table :entries do |t|
      t.string :idparcel
      t.string :name
      t.string :desti

      t.timestamps
    end
  end
end
