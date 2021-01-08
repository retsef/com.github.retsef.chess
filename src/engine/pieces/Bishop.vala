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

        if(!start.is_last_row && !start.is_last_column) {
            result.append(start.top_right());

            while(!result.last().data.is_last_row && !result.last().data.is_last_column) {
                var last = result.last().data;

                result.append(last.top_right());
            }
        }


        if(!start.is_last_row && !start.is_first_column) {
            result.append(start.top_left());

            while(!result.last().data.is_last_row && !result.last().data.is_first_column) {
                var last = result.last().data;

                result.append(last.top_left());
            }
        }


        if(!start.is_first_row && !start.is_last_column) {
            result.append(start.bottom_right());

            while(!result.last().data.is_first_row && !result.last().data.is_last_column) {
                var last = result.last().data;

                result.append(last.bottom_right());
            }
        }


        if(!start.is_first_row && !start.is_first_column) {
            result.append(start.bottom_left());

            while(!result.last().data.is_first_row && !result.last().data.is_first_column) {
                var last = result.last().data;

                result.append(last.bottom_left());
            }
        }

        return result;
    }

}
