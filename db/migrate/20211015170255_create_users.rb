class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :handle
      t.string :email
      t.string :password_digest
      t.string :image_url
      t.string :stream_url
      t.text :bio
      t.integer :game_id

      t.timestamps
    end
  end
end
