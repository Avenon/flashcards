require 'spec_helper'

describe Card
  it "user text should be equal to original text " do
    card = Card.new(original_text: "house")
    card.check_translate("house").should == true
  end
end
