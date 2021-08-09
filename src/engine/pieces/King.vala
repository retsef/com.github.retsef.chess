using Gee;

public class King : Piece {

    public King(Piece.Colour colour) {
        // base(colour);
        this.colour = colour;
    }

    public override string symbol_resource() {
        return base.colour == Piece.Colour.White ?
        "/com/github/retsef/chess/pieces/KingW.png" :
        "/com/github/retsef/chess/pieces/KingB.png";
    }

    public override Piece clone() {
        return new King(this.colour);
    }

    public override string to_string() {
        return "King " + base.colour.to_string();
    }

    public override Gee.List<Coordinate> movement(Coordinate start) {
        var result = new ArrayList<Coordinate>();

        if(!start.is_first_row) {
            result.add(start.bottom());
        }
        if(!start.is_first_column) {
            result.add(start.left());
        }
        if(!start.is_first_row && start.is_first_column) {
            result.add(start.bottom_left());
        }


        if(!start.is_last_row) {
            result.add(start.top());
        }
        if(!start.is_last_column) {
            result.add(start.right());
        }
        if(!start.is_last_row && start.is_last_column) {
            result.add(start.top_right());
        }

        return result;
    }

}
