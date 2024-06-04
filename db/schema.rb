# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_06_04_122239) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "cart_items", force: :cascade do |t|
    t.integer "quantity"
    t.float "total"
    t.integer "status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "product_id", null: false
    t.bigint "user_id", null: false
    t.bigint "crop_id", null: false
    t.index ["crop_id"], name: "index_cart_items_on_crop_id"
    t.index ["product_id"], name: "index_cart_items_on_product_id"
    t.index ["user_id"], name: "index_cart_items_on_user_id"
  end

  create_table "communications", force: :cascade do |t|
    t.integer "sender_id"
    t.integer "receiver_id"
    t.text "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "crops", force: :cascade do |t|
    t.string "crop_name"
    t.integer "crop_age"
    t.float "acreage"
    t.integer "trees_0_to_3"
    t.integer "trees_4_to_7"
    t.integer "trees_7_plus"
    t.string "farm_plot_no"
    t.string "variety"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_crops_on_user_id"
  end

  create_table "feedbacks", force: :cascade do |t|
    t.integer "tourist_id"
    t.integer "expert_id"
    t.integer "rating"
    t.text "comments"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "issues", force: :cascade do |t|
    t.text "description"
    t.string "issue_type"
    t.datetime "time"
    t.integer "status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "crop_id", null: false
    t.bigint "user_id", null: false
    t.bigint "farm_specialist_id", null: false
    t.index ["crop_id"], name: "index_issues_on_crop_id"
    t.index ["farm_specialist_id"], name: "index_issues_on_farm_specialist_id"
    t.index ["user_id"], name: "index_issues_on_user_id"
  end

  create_table "matches", force: :cascade do |t|
    t.bigint "tourist_id", null: false
    t.bigint "local_tourist_attraction_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["local_tourist_attraction_id"], name: "index_matches_on_local_tourist_attraction_id"
    t.index ["tourist_id"], name: "index_matches_on_tourist_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.float "price"
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.bigint "crop_id", null: false
    t.index ["crop_id"], name: "index_products_on_crop_id"
    t.index ["user_id"], name: "index_products_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "jti", null: false
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.integer "role", default: 0
    t.string "location", null: false
    t.string "national_id", null: false
    t.string "phone_number", null: false
    t.string "expertise"
    t.string "languages"
    t.string "experience"
    t.string "bio"
    t.string "preferences"
    t.string "interests"
    t.float "average_rating"
    t.integer "number_of_ratings"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["jti"], name: "index_users_on_jti", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "cart_items", "crops"
  add_foreign_key "cart_items", "products"
  add_foreign_key "cart_items", "users"
  add_foreign_key "crops", "users"
  add_foreign_key "issues", "crops"
  add_foreign_key "issues", "users"
  add_foreign_key "issues", "users", column: "farm_specialist_id"
  add_foreign_key "matches", "users", column: "local_tourist_attraction_id"
  add_foreign_key "matches", "users", column: "tourist_id"
  add_foreign_key "products", "crops"
  add_foreign_key "products", "users"
end
