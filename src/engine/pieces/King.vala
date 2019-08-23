public class King : Piece {

    public King(Piece.Colour colour) {
        base(colour);
    }


    public override string symbol_resource() {
        return base.colour == Piece.Colour.White ?
        "/com/github/retsef/chess/pieces/KingW.png" :
        "/com/github/retsef/chess/pieces/KingB.png";
    }

    public override List<Coordinate> movement(Coordinate start) {
        var result = new List<Coordinate>();

        if(!start.row.is_first()) {
            result.append(new Coordinate(
                start.row.prev(),
                start.column
            ));
        }
        if(!start.column.is_first()) {
            result.append(new Coordinate(
                start.row,
                start.column.prev()
            ));
        }
        if(!start.row.is_first() && start.column.is_first()) {
            result.append(new Coordinate(
                start.row.prev(),
                start.column.prev()
            ));
        }


        if(!start.row.is_last()) {
            result.append(new Coordinate(
                start.row.next(),
                start.column
            ));
        }
        if(!start.column.is_last()) {
            result.append(new Coordinate(
                start.row,
                start.column.next()
            ));
        }
        if(!start.row.is_last() && start.column.is_last()) {
            result.append(new Coordinate(
                start.row.next(),
                start.column.next()
            ));
        }

        return result;
    }

}
