class CreateBlogposts < ActiveRecord::Migration[7.0]
  def change
    create_table :blogposts do |t|
      t.string :title
      t.string :aouther
      t.string :content
      t.date :publish_date

      t.timestamps
    end
  end
end
