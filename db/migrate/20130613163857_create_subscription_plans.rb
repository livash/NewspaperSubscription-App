class CreateSubscriptionPlans < ActiveRecord::Migration
  def change
    create_table :subscription_plans do |t|
      t.integer :newspaper_id
      t.integer :price
      t.boolean :subscription_type

      t.timestamps
    end
  end
end
