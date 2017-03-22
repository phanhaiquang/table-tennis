class CreateCups < ActiveRecord::Migration[5.0]
  def change
    create_table :cups do |t|
      t.string :name
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
