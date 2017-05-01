require 'rails_helper'

describe QuestionnaireDecorator do
  let(:questionnaire) { Questionnaire.new.extend QuestionnaireDecorator }
  subject { questionnaire }
  it { should be_a Questionnaire }
end
