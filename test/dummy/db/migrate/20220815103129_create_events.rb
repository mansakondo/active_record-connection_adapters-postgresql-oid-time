class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.time :start
      t.time :end
      t.time :times, array: true

      t.timestamps
    end
  end
end
