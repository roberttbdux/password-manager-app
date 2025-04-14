class AddFieldsToPasswords < ActiveRecord::Migration[8.0]
  def change
    add_column :passwords, :service, :string
    add_column :passwords, :email, :string
    add_column :passwords, :password, :string
  end
end
