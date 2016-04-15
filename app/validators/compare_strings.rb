class CompareStrings < ActiveModel::Validator
  def validate(record)
    return if record.original_text.blank? || record.translated_text.blank?

    if record.original_text.mb_chars.casecmp(record.translated_text.mb_chars) == 0
      record.errors[:base] << (t :validates_compare)
    end
  end
end
