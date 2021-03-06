class CreateProviders < ActiveRecord::Migration[5.2]
  def change
    create_table :providers do |t|
      t.string :first_name
      t.string :last_name
      t.references :destination, foreign_key: true

      t.timestamps
    end
  end
end
