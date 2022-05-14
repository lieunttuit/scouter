class RemoveForeignKeyFromEvaluateeIdInEvaluations < ActiveRecord::Migration[6.1]
  def change
    remove_foreign_key :evaluations, :evaluatee_id
  end
end
