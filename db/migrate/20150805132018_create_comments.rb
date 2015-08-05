class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :photo_url

      t.timestamps null: false
    end
  end
end
