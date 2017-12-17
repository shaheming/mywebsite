class RemaneGroupId < ActiveRecord::Migration[5.0]
  def change
    rename_column :posts,:group_id,:meetup_id
  end
end
