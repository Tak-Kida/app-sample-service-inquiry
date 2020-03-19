class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.integer :urgency
      t.text :summary
      t.text :detail
      t.boolean :done_flag, default: false, null: false
      t.text :deal_with_policy, default: "検討中", null:"検討中"
      t.text :deal_with_detail, default: "検討中です", null:"検討中です" 

      t.timestamps
    end
  end
end
