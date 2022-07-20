class AddFirstnameToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :first_name_zen, :string
  end
end
