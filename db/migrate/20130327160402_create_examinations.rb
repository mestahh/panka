class CreateExaminations < ActiveRecord::Migration
  def change
    create_table :examinations do |t|
      t.string :anamnezis
      t.string :status
      t.string :treatment
      t.string :charge

      t.timestamps
    end
  end
end
