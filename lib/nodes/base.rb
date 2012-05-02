class RScript::Nodes::Base
  def initialize(sexp)
    @sexp = sexp
  end

  def next_node
    raise "Not implemented"
  end

  def parse
    raise "Not Implemented"
  end
end
