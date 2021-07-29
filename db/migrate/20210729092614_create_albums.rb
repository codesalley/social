class CreateAlbums < ActiveRecord::Migration[6.1]
  def change
    create_table :albums do |t|
      t.string :name
      t.references :user, null: false, foreign_key: true
      t.boolean :public, :default => false
      #Ex:- :default =>''
      t.timestamps
    end
  end
end
