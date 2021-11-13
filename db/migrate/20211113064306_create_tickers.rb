class CreateTickers < ActiveRecord::Migration
  def up
    create_table :tickers do |t|
      t.string :symbol
      t.string :name
      t.string :sector
      t.string :industry
      t.timestamps null: false
    end
  end

  def down
    drop_table :tickers if table_exists? :tickers
  end
end
