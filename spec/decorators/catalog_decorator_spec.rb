require 'rails_helper'

describe CatalogDecorator do
  let(:catalog) { Catalog.new.extend CatalogDecorator }
  subject { catalog }
  it { should be_a Catalog }
end
