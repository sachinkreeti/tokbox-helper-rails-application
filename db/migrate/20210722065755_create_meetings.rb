class CreateMeetings < ActiveRecord::Migration[6.1]
  def change
    create_table :meetings do |t|
      t.string :session_id
      t.string :name

      t.timestamps
    end
  end
end
