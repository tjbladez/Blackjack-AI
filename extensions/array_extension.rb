module Tj
  module ArrayExtensions
    def sum
      inject(0) {|acc, i| acc + i}
    end
  end
end

Array.send(:include, Tj::ArrayExtensions)