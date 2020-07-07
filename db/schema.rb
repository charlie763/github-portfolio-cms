# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_07_06_230100) do

  create_table "portfolios", force: :cascade do |t|
    t.string "name"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "portfolios_repos", force: :cascade do |t|
    t.integer "portfolio_id"
    t.integer "repo_id"
    t.index ["portfolio_id"], name: "index_portfolios_repos_on_portfolio_id"
    t.index ["repo_id"], name: "index_portfolios_repos_on_repo_id"
  end

  create_table "repos", force: :cascade do |t|
    t.string "name"
    t.string "github_url"
    t.text "description"
    t.integer "user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "github_username"
  end

end
