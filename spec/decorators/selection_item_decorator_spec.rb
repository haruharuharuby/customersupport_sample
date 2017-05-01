require 'rails_helper'

describe SelectionItemDecorator do
  let(:selection_item) { SelectionItem.new.extend SelectionItemDecorator }
  subject { selection_item }
  it { should be_a SelectionItem }
end
