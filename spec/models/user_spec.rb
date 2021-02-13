require 'rails_helper'
RSpec.describe User, type: :model do
  describe "ユーザー新規登録" do
    it "nicknameが空だと登録できない" do
      user = User.new(nickname: "", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000", family_name: "a", first_name: "b", family_name_kana: "c", first_name_kana: "d", birth_day: "e" )
       user.valid?
       expect(user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "emailが空では登録できない" do
      user = User.new(nickname: "abe", email: "", password: "00000000", password_confirmation: "00000000", family_name: "a", first_name: "b", family_name_kana: "c", first_name_kana: "d", birth_day: "e" )
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end
    it "passwordが空では登録できない" do
      user = User.new(nickname: "abe", email: "kkk@gmail.com", password: "", password_confirmation: "00000000", family_name: "a", first_name: "b", family_name_kana: "c", first_name_kana: "d", birth_day: "e" )
      user.valid?
      expect(user.errors.full_messages).to include("Password can't be blank")
    end
    it "password_confirmationが空では登録できない" do
      user = User.new(nickname: "abe", email: "kkk@gmail.com", password: "0000000", password_confirmation: "", family_name: "a", first_name: "b", family_name_kana: "c", first_name_kana: "d", birth_day: "e" )
      user.valid?
      expect(user.errors.full_messages).to include("Password_confirmation can't be blank")
    end
    it "family_nameが空では登録できない" do
      user = User.new(nickname: "abe", email: "kkk@gmail.com", password: "0000000", password_confirmation: "0000000", family_name: "", first_name: "b", family_name_kana: "c", first_name_kana: "d", birth_day: "e" )
      user.valid?
      expect(user.errors.full_messages).to include("Family_name can't be blank")
    end
    it "first_nameが空では登録できない" do
      user = User.new(nickname: "abe", email: "kkk@gmail.com", password: "0000000", password_confirmation: "0000000", family_name: "a", first_name: "", family_name_kana: "c", first_name_kana: "d", birth_day: "e" )
      user.valid?
      expect(user.errors.full_messages).to include("First_name can't be blank")
    end
    it "family_name_kanaが空では登録できない" do
      user = User.new(nickname: "abe", email: "kkk@gmail.com", password: "0000000", password_confirmation: "0000000", family_name: "a", first_name: "b", family_name_kana: "", first_name_kana: "d", birth_day: "e" )
      user.valid?
      expect(user.errors.full_messages).to include("Family_name_kana can't be blank")
    end
    it "first_name_kanaが空では登録できない" do
      user = User.new(nickname: "abe", email: "kkk@gmail.com", password: "0000000", password_confirmation: "0000000", family_name: "a", first_name: "b", family_name_kana: "c", first_name_kana: "", birth_day: "e" )
      user.valid?
      expect(user.errors.full_messages).to include("First_name_kana can't be blank")
    end
    it "birth_dayが空では登録できない" do
      user = User.new(nickname: "abe", email: "kkk@gmail.com", password: "0000000", password_confirmation: "0000000", family_name: "a", first_name: "b", family_name_kana: "c", first_name_kana: "d", birth_day: "" )
      user.valid?
      expect(user.errors.full_messages).to include("Birth_day can't be blank")
    end
  end
end