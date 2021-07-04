class FixForeignKeys < ActiveRecord::Migration[6.1]
  def change
    rename_column :events, :creator_id, :user_id
    remove_column :users, :organisation_id
  end
end
