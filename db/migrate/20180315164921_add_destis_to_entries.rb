class AddDestisToEntries < ActiveRecord::Migration[5.1]
  def change
    add_reference :entries, :desti, foreign_key: true
  end
end
