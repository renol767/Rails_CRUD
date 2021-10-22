class CreateCruds < ActiveRecord::Migration[6.1]
  def change
    create_table :cruds do |t|
      t.string :name
      t.string :email
      t.string :address
      t.boolean :status

      t.datetime :modified_at, default: -> { 'CURRENT_TIMESTAMP' }
      t.timestamps
    end
  end
end
