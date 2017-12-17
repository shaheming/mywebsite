class ChangeDateAndDescript < ActiveRecord::Migration[5.0]
  def change
    rename_column :meetups,:descript,:description
    remove_column :meetups,:date
    add_column :meetups,:meetup_time,:date
  end
end
