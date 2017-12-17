class RenameImages < ActiveRecord::Migration[5.0]
  def change
    rename_column :images,:file_name,:attachment
    add_index :images,:id
  end
end
