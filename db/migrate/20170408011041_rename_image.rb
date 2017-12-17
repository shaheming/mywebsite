class RenameImage < ActiveRecord::Migration[5.0]
  def change
    rename_column :images,:attachment,:avatar
  end
end
