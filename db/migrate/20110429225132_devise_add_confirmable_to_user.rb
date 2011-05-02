class DeviseAddConfirmableToUser < ActiveRecord::Migration
  def self.up
    change_table(:users) do |t|
      t.confirmable
      add_index :users, :confirmation_token,   :unique => true
    end
  end

  def self.down
  end
end
