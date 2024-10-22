class Tag < ActsAsTaggableOn::Tag
  ActsAsTaggableOn.delimiter = ";"
  def self.machine_learning?
    MachineLearning.enabled? && Setting["machine_learning.tags"].present?
  end
end
