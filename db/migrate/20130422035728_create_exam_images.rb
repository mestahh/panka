class CreateExamImages < ActiveRecord::Migration
  def change
    create_table :exam_images do |t|
      t.integer :examination_id
      t.string :image

      t.timestamps
    end
  end
end
