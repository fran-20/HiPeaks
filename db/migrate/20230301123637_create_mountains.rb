class CreateMountains < ActiveRecord::Migration[7.0]
  def change
    create_table :mountains do |t|
      t.string :name
      t.string :kana
      t.integer :height
      t.string :area

      t.timestamps
    end
  end
end