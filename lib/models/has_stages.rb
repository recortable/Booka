module Models
  module HasStages
    def has_stage?(stage)
      puts "JODER #{self.stages}"
      !(Regexp.new(stage.to_s) =~ self.stages).nil?
    end
  end
end