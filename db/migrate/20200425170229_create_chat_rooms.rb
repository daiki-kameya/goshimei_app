class CreateChatRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :chat_rooms do |t|
      t.integer :sender_id, index: true
      t.integer :recipient_id, index: true
    end
  end
end
