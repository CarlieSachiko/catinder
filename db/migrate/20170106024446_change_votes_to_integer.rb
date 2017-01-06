class ChangeVotesToInteger < ActiveRecord::Migration
  def change
    change_column :cats, :votes, 'integer USING CAST(votes AS integer)'
  end
end
