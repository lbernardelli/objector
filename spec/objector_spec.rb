require 'spec_helper'

describe Objector do

  subject { SampleClass.new(data) }

  context 'Simple class' do
    let(:data) { {name: 'John', description: 'Sample description'} }

    it { expect(subject.name).to eql(data[:name]) }
    it { expect(subject.description).to eql(data[:description]) }

    class SampleClass
      include Objector

      attr_reader :name, :description
    end
  end

  context 'Class with 1 hierarchy level' do

    let(:data) { {name: 'John', sample_relation: {definition: 'Sample relation definition'}} }

    it { expect(subject.name).to eql(data[:name]) }
    it { expect(subject.sample_relation).to be_kind_of(SampleRelation) }
    it { expect(subject.sample_relation.definition).to eql(data[:sample_relation][:definition]) }


    class SampleClass
      include Objector

      attr_reader :name, :sample_relation
    end

    class SampleRelation
      include Objector

      attr_reader :definition
    end
  end

  context 'Complex object' do

  end

end