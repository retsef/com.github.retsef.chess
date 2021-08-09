using Gee;

public class Pawn : Piece{

    public Pawn(Piece.Colour colour) {
        // base(colour);
        this.colour = colour;
    }


    public override string symbol_resource() {
        return base.colour == Piece.Colour.White ?
        "/com/github/retsef/chess/pieces/PawnW.png" :
        "/com/github/retsef/chess/pieces/PawnB.png";
    }

    public override Piece clone() {
        return new Pawn(this.colour);
    }

    public override string to_string() {
        return "Pawn " + base.colour.to_string();
    }

    public override Gee.List<Coordinate> movement(Coordinate start) {
        var result = new ArrayList<Coordinate>();

        if(colour == Piece.Colour.White) {
            if(start.is_last_row) return result;

            var coord = start.top();
            result.add(coord);

            if(coord.is_last_row) return result;
            result.add(coord.top());

            return result;
        }

        if(colour == Piece.Colour.Black) {
            if(start.is_first_row) return result;

            var coord = start.bottom();
            result.add(coord);

            if(coord.is_first_row) return result;
            result.add(coord.bottom());

            return result;
        }

        return result;
    }

}
