class CreateChats < ActiveRecord::Migration[5.1]
  def change
    create_table :chats do |t|
      t.string :sender
      t.string :receiver

      t.timestamps
    end
  end
end
