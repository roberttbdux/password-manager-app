class CreatePasswords < ActiveRecord::Migration[8.0]
  def change
    create_table :passwords do |t|
      t.string :service_name
      t.datetime :last_used
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
