class CreatePasses < ActiveRecord::Migration[5.2]
  def change
    create_table :passes do |t|
      t.string :username
      t.text :phrase_bidx, index: true
      t.text :phrase_ciphertext

      t.timestamps null: false
    end
  end
end
