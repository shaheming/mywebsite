class AddTokenToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :authentication_token, :string,:index=>true, :unique => true
    User.find_each do |u|
      puts "generate user #{u.id} token"
      u.generate_authentication_token
      u.save! 
    end
  end
end
