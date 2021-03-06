# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define() do

  create_table "actions", :force => true do |t|
    t.string  :name,       :limit => 40
    t.text    :intro
    t.string  :for_what,    :limit => 40
  end


  create_table "comments", :force => true do |t|
    t.integer  :user_id,    :null => false
    t.text     :content
    t.integer  :commentable_id
    t.string   :commentable_type, :limit => 40
    t.timestamps
  end

  create_table "follows", :force => true do |t|
    t.integer  :user_id,    :null => false
    t.integer  :followable_id
    t.string   :followable_type, :limit => 40
    t.timestamps
  end

  create_table "feedbacks", :force => true do |t|
    t.string   :text
    t.string   :email
    t.timestamps
  end
  
  create_table "geos", :force => true do |t|
    t.string  :name,       :limit => 40
    t.integer :parent_id
    t.integer :zipcode
    t.integer :zoom_level
    t.string  :slug,       :limit => 40
    t.string  :latitude,   :limit => 40
    t.string  :longitude,  :limit => 40    
  end

  create_table "plans", :force => true do |t|
    t.integer  :user_id
    t.integer  :venue_id
    t.integer  :action_id
    t.integer  :requirement_id
    t.integer  :record_id
    t.integer  :parent_id
    t.integer  :money
    t.integer  :goods
    t.datetime :plan_at
    t.boolean  :has_new_comment,  :default => false
    t.timestamps
  end

  create_table "photos", :force => true do |t|
    t.integer  :user_id
    t.integer  :imageable_id
    t.string   :imageable_type
    t.string   :title,       :limit => 40
    t.string   :photo_file_name
    t.timestamps
  end

  create_table "profiles", :force => true do |t|
    t.integer :user_id
  end

  create_table "records", :force => true do |t|
    t.integer  :user_id
    t.integer  :venue_id
    t.integer  :action_id
    t.integer  :plan_id
    t.integer  :requirement_id
    t.integer  :parent_id
    t.integer  :money
    t.string   :donate_for,  :limit => 40
    t.integer  :goods
    t.string   :goods_is,    :limit => 40
    t.integer  :time
    t.string   :do_what,     :limit => 40
    t.datetime :done_at
    t.boolean  :has_new_comment,  :default => false
    t.timestamps
  end

  create_table "users", :force => true do |t|
    t.string   :login,                     :limit => 40
    t.string   :name,                      :limit => 100, :default => ""
    t.string   :email,                     :limit => 100
    t.string   :crypted_password,          :limit => 40
    t.string   :salt,                      :limit => 40
    t.string   :avatar_file_name
    t.datetime :created_at
    t.datetime :updated_at
    t.integer  :geo_id
    t.string   :remember_token,            :limit => 40
    t.datetime :remember_token_expires_at
  end
  
  create_table "requirements", :force => true do |t|
    t.integer :venue_id
    t.integer :action_id
    t.integer :publisher_id
    t.integer :total_money
    t.string  :donate_for,  :limit => 40
    t.integer :total_goods
    t.string  :goods_is,    :limit => 40
    t.integer :total_people
    t.string  :do_what,     :limit => 40
    t.text    :detail
    t.boolean :has_new_comment
    t.timestamps
  end  

  add_index "users", ["login"], :name => "index_users_on_login", :unique => true

  create_table "venues", :force => true do |t|
    t.string  :name,       :limit => 40
    t.text    :intro
    t.string  :category,   :limit => 40
    t.integer :geo_id
    t.integer :creator_id
    t.string  :latitude,   :limit => 40
    t.string  :longitude,  :limit => 40
    t.string  :cover_file_name
    t.timestamps
  end
  
  create_table "oauth_tokens",:force => true do |t|
    t.integer :user_id
    t.string  :request_key
    t.string  :request_secret
    t.string  :access_key
    t.string  :access_secret
    t.string  :site
    t.timestamps
  end
end
