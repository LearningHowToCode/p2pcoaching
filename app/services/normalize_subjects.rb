class NormalizeSubjects

  attr_reader :subjects

  def initialize(subjects)
    @subjects = subjects
  end


  def call
    subjects.values.reject(&:blank?).map(&:strip).uniq.join(', ')
  end
end