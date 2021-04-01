require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the MediaHelper. For example:
#
# describe MediaHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe MediaHelper, type: :helper do
  describe "Image methods" do
    describe "#get_image_path" do
      it "returns placeholder image when no image" do
        expect(helper.get_image_path("")).to be == "150.png"
      end

      it "returns url when img is not saved" do
        expect(helper.get_image_path("abc")).to include("w94_and_h141_bestv2")
      end
    end

    describe "#trim_img_path" do
      it "returns path without /" do
        expect(helper.trim_img_path("/asdjpojdqwd")).to_not include("/")
      end
    end

    describe "#append_img_size" do
      it "appends _full.jpg to path" do
        expect(helper.append_img_size("/asdjoiwjqid.jpg")).to include("_full.jpg")
      end
    end

    describe "#get_big_image_path" do
      it "returns placeholder image when no image" do
        expect(helper.get_big_image_path("")).to be == "150.png"
      end

      it "returns url when img is not saved" do
        expect(helper.get_big_image_path("abc")).to include("original")
      end
    end

    describe "#convert_date" do
      it "returns formatted date" do
        expect(helper.convert_date("12-01-2020")).to include("12 de janeiro de 2020")
      end
    end
  end
end
