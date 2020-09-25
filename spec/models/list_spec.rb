require 'rails_helper'

RSpec.describe List, type: :model do

  context 'name greater than 140 characters' do
    it 'raises an error on save' do
      string_with_140_char = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris"\
                             "metus nulla, consequat et sapien eget,"\
                             "pellentesque facilisis sem. Sed at ante tellus."

      expect { List.create!(title: string_with_140_char) }
        .to raise_error(ActiveRecord::RecordInvalid)
    end
  end
end
