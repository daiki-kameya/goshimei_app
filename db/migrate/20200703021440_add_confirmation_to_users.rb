class AddConfirmationToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :confirmation, :boolean, default: true
  end
end
