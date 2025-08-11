class AddFullNameAndPasswordDigestToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :full_name, :string
    # remove add_column :password_digest because it exists already
  end
end
