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

    public override string to_string() {
        return "King " + base.colour.to_string();
    }

    public override List<Coordinate> movement(Coordinate start) {
        var result = new List<Coordinate>();

        if(!start.is_first_row) {
            result.append(new Coordinate(
                start.row.prev(),
                start.column
            ));
        }
        if(!start.is_first_column) {
            result.append(new Coordinate(
                start.row,
                start.column.prev()
            ));
        }
        if(!start.is_first_row && start.is_first_column) {
            result.append(new Coordinate(
                start.row.prev(),
                start.column.prev()
            ));
        }


        if(!start.is_last_row) {
            result.append(new Coordinate(
                start.row.next(),
                start.column
            ));
        }
        if(!start.is_last_column) {
            result.append(new Coordinate(
                start.row,
                start.column.next()
            ));
        }
        if(!start.is_last_row && start.is_last_column) {
            result.append(new Coordinate(
                start.row.next(),
                start.column.next()
            ));
        }

        return result;
    }

}
