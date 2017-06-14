require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do

  describe 'alert_class' do
    it "returns different alert class type" do
      expect(helper.alert_class('error')).to eq('alert-danger')
    end

    it "returns alert class type" do
      expect(helper.alert_class('warning')).to eq('alert-warning')
    end
  end
end
