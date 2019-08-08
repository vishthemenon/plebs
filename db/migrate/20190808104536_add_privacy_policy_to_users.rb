class AddPrivacyPolicyToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :privacy_policy, :boolean
  end
end
