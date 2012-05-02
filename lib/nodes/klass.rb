module RScript::Nodes
  class Klass < Base
    def next_node
      @sexp.last
    end

    def parse
      klass_name = @sexp[1]

      <<-EOF
      var #{klass_name};
      #{klass_name} = (function() {
        function #{klass_name}() {}
        return #{klass_name};
        #{RScript::Nodes.make(next_node).parse}
      })();
      EOF

    end

  end

  register(:class, Klass)
end
