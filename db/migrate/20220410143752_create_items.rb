class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :name
      t.text       :explanation
      t.string     :price
      t.string     :category_id
      t.string     :product_status_id 
      t.string     :delivery_charge_id
      t.string     :prefecture_id
      t.string     :shipping_date_id
      t.references :user
      t.timestamps
    end
  end
end

