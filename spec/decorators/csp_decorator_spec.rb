require 'rails_helper'

describe CspDecorator do
  let(:csp) { Csp.new.extend CspDecorator }
  subject { csp }
  it { should be_a Csp }
end
