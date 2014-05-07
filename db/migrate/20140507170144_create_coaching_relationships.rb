class CreateCoachingRelationships < ActiveRecord::Migration
  def change
    create_table :coaching_relationships do |t|
      t.belongs_to :coach, index: true
      t.belongs_to :athlete, index: true

      t.timestamps
    end
  end
end
