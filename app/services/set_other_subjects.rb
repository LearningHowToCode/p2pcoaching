class SetOtherSubjects

  attr_reader :other_subjects

  def initialize(other_subjects)
    @other_subjects = other_subjects
  end


  def call
    other_subjects_names = other_subjects.split(',').map(&:strip).uniq

    other_subjects_names.map do |other_subject_name|
      Subject.find_or_create_by_name(other_subject_name).id.to_s
    end
  end
end