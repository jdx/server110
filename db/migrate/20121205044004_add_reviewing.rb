class AddReviewing < ActiveRecord::Migration
  def change
    add_column :tasks, :reviewed, :boolean, default: false, null: false
  end
end
