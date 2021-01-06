public class Bishop : Piece {

    public Bishop(Piece.Colour colour) {
        // base(colour);
        this.colour = colour;
    }

    public override string symbol_resource() {
        return base.colour == Piece.Colour.White ?
        "/com/github/retsef/chess/pieces/BishopW.png" :
        "/com/github/retsef/chess/pieces/BishopB.png";
    }

    public override string to_string() {
        return "Bishop " + base.colour.to_string();
    }

    public override List<Coordinate> movement(Coordinate start) {
        var result = new List<Coordinate>();

        if(!start.row.is_last() && !start.column.is_last()) {
            result.append(new Coordinate(start.row.next(), start.column.next()));

            while(!result.last().data.row.is_last() && !result.last().data.column.is_last()) {
                var last = result.last().data;

                result.append(new Coordinate(last.row.next(), last.column.next()));
            }
        }


        if(!start.row.is_last() && !start.column.is_first()) {
            result.append(new Coordinate(start.row.next(), start.column.prev()));

            while(!result.last().data.row.is_last() && !result.last().data.column.is_first()) {
                var last = result.last().data;

                result.append(new Coordinate(last.row.next(), last.column.prev()));
            }
        }


        if(!start.row.is_first() && !start.column.is_last()) {
            result.append(new Coordinate(start.row.prev(), start.column.next()));

            while(!result.last().data.row.is_first() && !result.last().data.column.is_last()) {
                var last = result.last().data;

                result.append(new Coordinate(last.row.prev(), last.column.next()));
            }
        }


        if(!start.row.is_first() && !start.column.is_first()) {
            result.append(new Coordinate(start.row.prev(), start.column.prev()));

            while(!result.last().data.row.is_first() && !result.last().data.column.is_first()) {
                var last = result.last().data;

                result.append(new Coordinate(last.row.prev(), last.column.prev()));
            }
        }

        return result;
    }

}
