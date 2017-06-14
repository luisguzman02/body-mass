RSpec.describe BodyMassIndex do

  describe ".call" do
    context "when given valid params" do
      subject(:context) { BodyMassIndex.call(weight: "80", height: "1.70") }

      it "succeeds" do
        expect(context).to be_a_success
      end

      it "provides the body mass index" do
        expect(context.index).to eq(27.7)
      end

      it "provides the user's secret token" do
        expect(context.category).to eq("Overweight")
      end
    end

    context "when index is greater than 40" do
      subject(:context) { BodyMassIndex.call(weight: "120", height: "1.70") }

      it "succeeds" do
        expect(context).to be_a_success
      end

      it "provides the body mass index" do
        expect(context.index).to eq(41.5)
      end

      it "provides the user's secret token" do
        expect(context.category).to eq("Obese Class III (Very severely obese)")
      end
    end

    context "when given invalid params" do
      subject(:context) { BodyMassIndex.call(weight: "a", height: "s") }

      it "fails" do
        expect(context).to be_a_failure
      end

      it "provides a failure error" do
        expect(context.error).to be_present
      end
    end
  end

end
