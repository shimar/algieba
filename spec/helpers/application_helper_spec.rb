require 'spec_helper'

describe ApplicationHelper do

  describe :submit_caption do

    it "returns 'Create' if the model is nil." do
      helper.submit_caption(nil).should == 'Create'
    end

    it "returns 'Create' if the model returns true with new_record?." do
      model = double(:model)
      model.stub(:new_record?).and_return true
      helper.submit_caption(model).should == 'Create'
    end

    it "returns 'Update' if the model returns false with new_record?." do
      model = double(:model)
      model.stub(:new_record?).and_return false
      helper.submit_caption(model).should == 'Update'
    end

  end

end
