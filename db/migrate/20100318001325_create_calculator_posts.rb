class CreateCalculatorPosts < ActiveRecord::Migration
  def self.up
    create_table :calculator_posts do |t|
      t.float :avia
      t.boolean :warning
      t.float :max_weight
      t.float :weight_limit
      t.float :declared_value
      t.float :default_cost
      t.float :add_cost

      t.timestamps
    end
  end

  def self.down
    drop_table :calculator_posts
  end
end
