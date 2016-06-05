class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.integer :survey_type
      t.string :survey_url

      t.timestamps null: false
    end
  end
end
