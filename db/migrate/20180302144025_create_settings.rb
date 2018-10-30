class CreateSettings < ActiveRecord::Migration[5.1]
  def change
    create_table :settings do |t|
      t.string :body
      t.time :duration

      t.timestamps
    end
  end
end
