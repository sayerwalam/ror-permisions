class CreateMessageThreads < ActiveRecord::Migration[5.1]
  def change
    create_table :message_threads do |t|
      t.string :body
      t.string :user1
      t.string :user2

      t.timestamps
    end
  end
end
