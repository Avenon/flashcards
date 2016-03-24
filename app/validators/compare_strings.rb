class CompareStrings < ActiveModel::Validator
  def validate(record)
    return if record.original_text.blank? || record.translated_text.blank?

    if record.original_text.mb_chars.downcase == record.translated_text.mb_chars.downcase
      record.errors[:base] << "Must be different"
    end
  end
end
