class CreateDestis < ActiveRecord::Migration[5.1]
  def change
    create_table :destis do |t|
      t.string :name
	  t.timestamps
    end
  end
end


