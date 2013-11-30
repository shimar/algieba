require 'spec_helper'

def test_default_value(model, attr, default)
  model.send(attr).should == default
end

def test_inclusion(model, attr, values)
  model.send("#{attr.to_s}=", values.min)
  model.valid?
  model.errors.include?(attr).should == nil

  model.send("#{attr.to_s}=", values.max)
  model.valid?
  model.errors.include?(attr).should == nil

  model.send("#{attr.to_s}=", values.min - 1)
  model.valid?
  model.errors.include?(attr).should == true

  model.send("#{attr.to_s}=", values.max + 1)
  model.valid?
  model.errors.include?(attr).should == true
end

describe Vaf do

  describe :associations do

    before(:each) do
      @model = Vaf.new
    end

    it "belongs to a software." do
      @model.respond_to?(:software).should == true
    end

  end

  describe :validations do
    before(:each) do
      @model = Vaf.new
    end

    describe :user_id do
      it "requires user_id." do
        @model.valid?
        @model.errors.include?(:user_id).should == true
        @model.user_id = 1
        @model.valid?
        @model.errors.include?(:user_id).should == nil
      end
    end

    describe :software_id do
      it "requires :software_id on update." do
        @model.valid?
        @model.errors.include?(:software_id).should == nil

        @vaf = FactoryGirl.create(:vaf)
        @vaf.software_id = nil
        @vaf.valid?
        @vaf.errors.include?(:software_id).should == true
      end
    end

    describe :data_communication do
      it "should be 0 as defaults." do
        @model.valid?
        test_default_value(@model, :data_communication, 0)
      end

      it "should be included in values of @@degree_of_influences." do
        test_inclusion(@model, :data_communication, Vaf.degree_of_influences.values)
      end
    end

    describe :distributed_data_processing do
      it "should be 0 as defaults." do
        @model.valid?
        test_default_value(@model, :distributed_data_processing, 0)
      end

      it "should be included in values of @@degree_of_influences." do
        test_inclusion(@model, :distributed_data_processing, Vaf.degree_of_influences.values)
      end
    end

    describe :performance do
      it "should be 0 as defaults." do
        @model.valid?
        test_default_value(@model, :performance, 0)
      end

      it "should be included in values of @@degree_of_influences." do
        test_inclusion(@model, :performance, Vaf.degree_of_influences.values)
      end
    end

    describe :heavily_used_configuration do
      it "should be 0 as defaults." do
        @model.valid?
        test_default_value(@model, :heavily_used_configuration, 0)
      end

      it "should be included in values of @@degree_of_influences." do
        test_inclusion(@model, :heavily_used_configuration, Vaf.degree_of_influences.values)
      end
    end

    describe :transaction_rate do
      it "should be 0 as defaults." do
        @model.valid?
        test_default_value(@model, :transaction_rate, 0)
      end

      it "should be included in values of @@degree_of_influences." do
        test_inclusion(@model, :transaction_rate, Vaf.degree_of_influences.values)
      end
    end

    describe :online_data_entry do
      it "should be 0 as defaults." do
        @model.valid?
        test_default_value(@model, :online_data_entry, 0)
      end

      it "should be included in values of @@degree_of_influences." do
        test_inclusion(@model, :online_data_entry, Vaf.degree_of_influences.values)
      end
    end

    describe :end_user_effeciency do
      it "should be 0 as defaults." do
        @model.valid?
        test_default_value(@model, :end_user_effeciency, 0)
      end

      it "should be included in values of @@degree_of_influences." do
        test_inclusion(@model, :end_user_effeciency, Vaf.degree_of_influences.values)
      end
    end

    describe :online_update do
      it "should be 0 as defaults." do
        @model.valid?
        test_default_value(@model, :online_update, 0)
      end

      it "should be included in values of @@degree_of_influences." do
        test_inclusion(@model, :online_update, Vaf.degree_of_influences.values)
      end
    end

    describe :complex_processing do
      it "should be 0 as defaults." do
        @model.valid?
        test_default_value(@model, :complex_processing, 0)
      end

      it "should be included in values of @@degree_of_influences." do
        test_inclusion(@model, :complex_processing, Vaf.degree_of_influences.values)
      end
    end

    describe :reusability do
      it "should be 0 as defaults." do
        @model.valid?
        test_default_value(@model, :reusability, 0)
      end

      it "should be included in values of @@degree_of_influences." do
        test_inclusion(@model, :reusability, Vaf.degree_of_influences.values)
      end
    end

    describe :installation_ease do
      it "should be 0 as defaults." do
        @model.valid?
        test_default_value(@model, :installation_ease, 0)
      end

      it "should be included in values of @@degree_of_influences." do
        test_inclusion(@model, :installation_ease, Vaf.degree_of_influences.values)
      end
    end

    describe :operational_ease do
      it "should be 0 as defaults." do
        @model.valid?
        test_default_value(@model, :operational_ease, 0)
      end

      it "should be included in values of @@degree_of_influences." do
        test_inclusion(@model, :operational_ease, Vaf.degree_of_influences.values)
      end
    end

    describe :multiple_sites do
      it "should be 0 as defaults." do
        @model.valid?
        test_default_value(@model, :multiple_sites, 0)
      end

      it "should be included in values of @@degree_of_influences." do
        test_inclusion(@model, :multiple_sites, Vaf.degree_of_influences.values)
      end
    end

    describe :facilitate_change do
      it "should be 0 as defaults." do
        @model.valid?
        test_default_value(@model, :facilitate_change, 0)
      end

      it "should be included in values of @@degree_of_influences." do
        test_inclusion(@model, :facilitate_change, Vaf.degree_of_influences.values)
      end
    end

  end

  describe :total_degree_of_influences do
    it "returns sum of each factor." do
      vaf = FactoryGirl.build(:vaf)
      vaf.total_degree_of_influences.should == 14
    end
  end

end
