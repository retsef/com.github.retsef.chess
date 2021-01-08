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

    public override string to_string() {
        return "Pawn " + base.colour.to_string();
    }

    public override List<Coordinate> movement(Coordinate start) {
        var result = new List<Coordinate>();

        if(colour == Piece.Colour.White) {
            if(start.is_last_row) return result;

            var coord = new Coordinate(start.row.next(), start.column);
            result.append(coord);

            if(coord.is_last_row) return result;
            result.append(new Coordinate(coord.row.next(), coord.column));

            return result;
        }

        if(colour == Piece.Colour.Black) {
            if(start.is_first_row) return result;

            var coord = new Coordinate(start.row.prev(), start.column);
            result.append(coord);

            if(coord.is_first_row) return result;
            result.append(new Coordinate(coord.row.prev(), coord.column));

            return result;
        }

        return result;
    }

}
