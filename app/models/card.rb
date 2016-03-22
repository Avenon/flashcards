class Card < ActiveRecord::Base
  validates :original_text, :translated_text, :review_date, presence: true
  validates :translated_text, exclusion: { in: :original_text, message: "Must be different with original text" }
  # <%= f.input :original_text, label: 'Оригинальный текст', label_html: {class: 'col-sm-2 control-label'}, :required => false, input_html: { class: "form-control"} %><br>
end
