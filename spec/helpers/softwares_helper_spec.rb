require 'spec_helper'

describe SoftwaresHelper do

  describe :render_measure_method do

    it "returns div contents includes the text of measure_method for display." do
      software = FactoryGirl.build(:software)
      fragment = helper.render_measure_method software
      fragment.should == "<div><span class='label label-info'>enhancement</span></div>"
      software.measure_method = 0
      fragment = helper.render_measure_method software
      fragment.should == "<div><span class='label label-info'>scratch</span></div>"
      software.measure_method = 2
      fragment = helper.render_measure_method software
      fragment.should == "<div><span class='label label-info'>application</span></div>"
    end

  end

end
