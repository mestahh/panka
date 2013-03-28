class CreateExaminations < ActiveRecord::Migration
  def change
    create_table :examinations do |t|
      t.string :anamnezis
      t.string :status
      t.string :treatment
      t.integer :charge
      t.integer :guest_id

      t.timestamps
    end
  end
end
