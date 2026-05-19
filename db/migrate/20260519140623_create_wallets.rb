class CreateWallets < ActiveRecord::Migration[8.1]
  def change
    create_table :wallets do |t|
      t.string :address

      t.timestamps
    end
  end
end

