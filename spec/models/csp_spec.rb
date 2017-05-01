require 'rails_helper'

RSpec.describe Csp, type: :model do
  context "number" do
    it "is valid number" do
      csp = Csp.new(number: "OPL00000", dm_number: "00000", grade: 0)
      expect(csp).to be_valid
    end

    it "is required" do
      csp = Csp.new(number: nil, dm_number: "00000", grade: 0)
      csp.valid?

      expect(csp.errors[:number]).to include("は不正な値です")
    end

    it "is invalid number (too many digits)" do
      csp = Csp.new(number: "OPL000001", dm_number: "00000", grade: 0)
      csp.valid?

      expect(csp.errors[:number]).to include("は不正な値です")
    end

    it "is invalid number (shortage digits)" do
      csp = Csp.new(number: "OPL0000", dm_number: "00000", grade: 0)
      csp.valid?
      expect(csp.errors[:number]).to include("は不正な値です")
    end

    it "is invalid number (no prefix)" do
      csp = Csp.new(number: "00000", dm_number: "00000", grade: 0)
      csp.valid?
      expect(csp.errors[:number]).to include("は不正な値です")
    end
  end

  context "dm_number" do
    it "is valid number" do
      csp = Csp.new(number: "OPL00000", dm_number: "00000", grade: 0)
      expect(csp).to be_valid
    end

    it "is required" do
      csp = Csp.new(number: "OPL00000", dm_number: nil, grade: 0)
      csp.valid?
      expect(csp.errors[:dm_number]).to include("は不正な値です")
    end

    it "is invalid number (too many digits)" do
      csp = Csp.new(number: "OPL00000", dm_number: "000000", grade: 0)
      csp.valid?
      expect(csp.errors[:dm_number]).to include("は不正な値です")
    end

    it "is invalid number (shortage digits)" do
      csp = Csp.new(number: "OPL00000", dm_number: "0000", grade: 0)
      csp.valid?
      expect(csp.errors[:dm_number]).to include("は不正な値です")
    end
  end

  context "periods" do
    it "must have period if user has agreements(= standard or premium)" do
    end

    it "must not have period if user not has agreements(= nothing)" do
    end
  end
end
