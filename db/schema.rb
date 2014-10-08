# encoding: UTF-8
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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20141008185844) do

  create_table "adjustors", force: true do |t|
    t.integer  "insurance_company_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone"
    t.string   "mobile"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "fax"
    t.string   "email"
  end

  add_index "adjustors", ["insurance_company_id"], name: "index_adjustors_on_insurance_company_id"

  create_table "appointments", force: true do |t|
    t.date     "date"
    t.time     "time"
    t.integer  "doctor_id"
    t.integer  "claim_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "appointments", ["claim_id"], name: "index_appointments_on_claim_id"
  add_index "appointments", ["doctor_id"], name: "index_appointments_on_doctor_id"

  create_table "attorneys", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "address"
    t.string   "city"
    t.integer  "state_id"
    t.string   "zip"
    t.string   "phone"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "attorneys", ["state_id"], name: "index_attorneys_on_state_id"

  create_table "claimants", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "address"
    t.string   "city"
    t.integer  "state_id"
    t.string   "zip"
    t.string   "phone"
    t.string   "mobile"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "ssn"
    t.string   "email"
    t.date     "dob"
    t.string   "gender"
  end

  add_index "claimants", ["state_id"], name: "index_claimants_on_state_id"

  create_table "claims", force: true do |t|
    t.string   "number"
    t.integer  "claimant_id"
    t.integer  "insurance_company_id"
    t.integer  "adjustor_id"
    t.integer  "attorney_id"
    t.integer  "appointment_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "service"
    t.string   "insured"
    t.string   "allegation"
    t.string   "case"
    t.date     "date_of_injury"
    t.text     "notes"
  end

  add_index "claims", ["adjustor_id"], name: "index_claims_on_adjustor_id"
  add_index "claims", ["appointment_id"], name: "index_claims_on_appointment_id"
  add_index "claims", ["attorney_id"], name: "index_claims_on_attorney_id"
  add_index "claims", ["claimant_id"], name: "index_claims_on_claimant_id"
  add_index "claims", ["insurance_company_id"], name: "index_claims_on_insurance_company_id"

  create_table "doctors", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "address"
    t.string   "city"
    t.integer  "state_id"
    t.string   "zip"
    t.string   "phone"
    t.string   "mobile"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "credentials"
    t.string   "active_practice"
    t.string   "board_certified"
    t.string   "fax"
    t.string   "email"
    t.decimal  "ime_charge"
    t.decimal  "no_show_fee"
    t.decimal  "deposition_fee"
    t.decimal  "deposition_cancel_fee"
    t.decimal  "record_review_fee"
    t.string   "tax_id"
    t.string   "license_number"
    t.string   "approx_turn_around"
    t.boolean  "dictation_service_interest"
    t.string   "poc_first_name"
    t.string   "poc_last_name"
    t.string   "poc_phone"
    t.string   "poc_email"
  end

  add_index "doctors", ["state_id"], name: "index_doctors_on_state_id"

  create_table "insurance_companies", force: true do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "address"
    t.string   "city"
    t.integer  "state_id"
    t.string   "zip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "insurance_companies", ["state_id"], name: "index_insurance_companies_on_state_id"

  create_table "states", force: true do |t|
    t.string   "name"
    t.string   "abbr"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "ansi_code"
    t.string   "statens"
  end

end
