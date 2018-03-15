class TableEntree < ActiveRecord::Migration[5.1]
  def change
      create_table :entrees

    add_column :entrees, :entreenum, :string
  end
end
