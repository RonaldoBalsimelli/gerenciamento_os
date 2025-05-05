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

ActiveRecord::Schema[8.0].define(version: 2025_05_05_190106) do
  create_table "clientes", force: :cascade do |t|
    t.string "nome"
    t.string "contato"
    t.text "endereco"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ordem_servicos", force: :cascade do |t|
    t.integer "cliente_id", null: false
    t.integer "tecnico_id", null: false
    t.text "descricao_problema"
    t.string "equipamento"
    t.datetime "data_inicio"
    t.datetime "data_fim"
    t.text "assinatura_cliente"
    t.string "status"
    t.decimal "latitude_inicio"
    t.decimal "latitude_fim"
    t.decimal "longitude_inicio"
    t.decimal "longitude_fim"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cliente_id"], name: "index_ordem_servicos_on_cliente_id"
    t.index ["tecnico_id"], name: "index_ordem_servicos_on_tecnico_id"
  end

  create_table "tecnicos", force: :cascade do |t|
    t.string "nome"
    t.string "contato"
    t.string "especialidade"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "ordem_servicos", "clientes"
  add_foreign_key "ordem_servicos", "tecnicos"
end
