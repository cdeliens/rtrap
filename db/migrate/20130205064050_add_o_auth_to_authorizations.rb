class AddOAuthToAuthorizations < ActiveRecord::Migration
  def change
    add_column :authorizations, :oauth_token, :string
    add_column :authorizations, :name, :string
    add_column :authorizations, :oauth_expires_at, :datetime
  end
end
