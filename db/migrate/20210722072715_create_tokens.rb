class CreateTokens < ActiveRecord::Migration[6.1]
  def change
    create_table :tokens do |t|
      t.references :meeting
      t.string :name
      t.text :token

      t.timestamps
    end
  end
end
