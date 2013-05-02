class AddCaptionToExamImages < ActiveRecord::Migration
  def change
    add_column :exam_images, :caption, :string
  end
end
