class AddDate < ActiveRecord::Migration
  def change
    add_column :tasks, :date, :date
    Task.find_each do |t|
      t.date = t.created_at
    end
    change_column :tasks, :date, :date, null: false
  end
end
