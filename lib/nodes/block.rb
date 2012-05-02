module  RScript::Nodes
  class Block < Base
    def initialize(sexp)
      super sexp
      next_node
    end

    def next_node
      @sexp.shift
    end

    def parse
      js = []
      while(node = next_node)
        js << RScript::Nodes.make(node).parse
      end

      js.join("\n")
    end
  end
  
  register(:block, Block)
end

