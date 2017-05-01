require 'rails_helper'

describe EstimationDecorator do
  let(:estimation) { Estimation.new.extend EstimationDecorator }
  subject { estimation }
  it { should be_a Estimation }
end
