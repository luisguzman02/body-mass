require 'rails_helper'

RSpec.describe CalculatorController, type: :controller do
  let(:user) { FactoryGirl.create(:user) }

  describe "calculate" do
    context "when params are valid" do
      before do
        sign_in user
        post :calculate, params: { weight: '90', height: '1.80' }
      end
      it "renders calculate view" do
        expect(response).to render_template(:calculate)
      end

      it "assigns index" do
        expect(assigns[:index]).not_to be_nil
      end

      it "assigns category" do
        expect(assigns[:category]).not_to be_nil
      end
    end

    context "when params are invalid" do
      before do
        sign_in user
        post :calculate, params: { weight: 'a', height: 'b' }
      end
      it "renders :new" do
        expect(response).to render_template(:new)
      end

      it "has flash message" do
        expect(request.flash[:alert]).not_to be_nil
      end

      it "doesn't assign index" do
        expect(assigns[:index]).to be_nil
      end

      it "doesn't assign category" do
        expect(assigns[:category]).to be_nil
      end
    end
  end

end
