class CompareStrings < ActiveModel::Validator
  def validate(record)
    return if record.original_text.blank? || record.translated_text.blank?

    if record.original_text.casecmp(record.translated_text) == 0
      record.errors[:base] << "Must be different"
    end
  end
end
