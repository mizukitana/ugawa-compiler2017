public class ASTNode {}

class ASTBinaryExprNode extends ASTNode {
	String op;
	ASTNode lhs;
	ASTNode rhs;
	ASTBinaryExprNode(String op, ASTNode lhs, ASTNode rhs) {
		this.op = op;
		this.lhs = lhs;
		this.rhs = rhs;
	}
	@Override
	public String toString() {
		return "(BinExpr "+op+" "+lhs+" "+rhs+")";
	}
}

class ASTUnaryExprNode extends ASTNode {
	String op;
	ASTNode rhs;
	ASTUnaryExprNode(String op, ASTNode rhs) {
		this.op = op;
		this.rhs = rhs;
	}
	@Override
	public String toString() {
		return "(UnExpr "+op+" "+rhs+")" ;
	}
}

class ASTNumberNode extends ASTNode {
	int value;
	ASTNumberNode(int value) {
		this.value = value;
	}
	@Override
	public String toString() {
		return "(Number "+value+")";
	}
}

class ASTVarRefNode extends ASTNode {
	String varName;
	ASTVarRefNode(String varName) {
		this.varName = varName;
	}
	@Override
	public String toString() {
		return "(VarRef "+varName+")";
	}
}