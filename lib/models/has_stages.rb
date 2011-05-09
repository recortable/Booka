module Models
  module HasStages
    def has_stage?(stage)
      !(Regexp.new(stage.to_s) =~ self.stages).nil?
    end
  end
end