require 'spec_helper'

module Ransack
  module Nodes
    describe Grouping do
      before do
        @g = 1
      end

      let(:context) { Context.for(Person) }

      subject { described_class.new(context) }

      describe '#attribute_method?' do
        context 'for attributes of the context' do
          it 'is true' do
            expect(subject.attribute_method?('name')).to be_true
          end

          context "where the attribute contains '_and_'" do
            it 'is true' do
              expect(subject.attribute_method?('terms_and_conditions')).to be_true
            end
          end
        end

        context 'for unknown attributes' do
          it 'is false' do
            expect(subject.attribute_method?('not_an_attribute')).to be_false
          end
        end
      end
    end
  end
end
