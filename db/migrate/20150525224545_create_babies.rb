class CreateBabies < ActiveRecord::Migration
  def change
    create_table :babies do |t|
      t.decimal :height, :precision => 10, :scale => 2
      t.integer :months_old
    end
  end
end
