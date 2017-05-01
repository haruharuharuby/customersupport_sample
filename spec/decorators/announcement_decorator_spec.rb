require 'rails_helper'

describe AnnouncementDecorator do
  let(:announcement) { Announcement.new.extend AnnouncementDecorator }
  subject { announcement }
  it { should be_a Announcement }
end
