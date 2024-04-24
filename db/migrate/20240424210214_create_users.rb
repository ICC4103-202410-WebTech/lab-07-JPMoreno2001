class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest

      t.timestamps
    end
  end
end

class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.references :user, foreign_key: true
      t.integer :answers_count, default: 0
      t.integer :likes_count, default: 0
      t.datetime :published_at, default: -> { 'CURRENT_TIMESTAMP' }

      t.timestamps
    end
  end
end

class CreateTags < ActiveRecord::Migration[6.0]
  def change
    create_table :tags do |t|
      t.string :name

      t.timestamps
    end
  end
end

class CreatePostTags < ActiveRecord::Migration[6.0]
  def change
    create_table :post_tags do |t|
      t.references :post, foreign_key: true
      t.references :tag, foreign_key: true

      t.timestamps
    end
  end
end
