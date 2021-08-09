using Gee;

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

    public override Piece clone() {
        return new Bishop(this.colour);
    }

    public override string to_string() {
        return "Bishop " + base.colour.to_string();
    }

    public override Gee.List<Coordinate> movement(Coordinate start) {
        var result = new ArrayList<Coordinate>();

        if(!start.is_last_row && !start.is_last_column) {
            result.add(start.top_right());

            while(!result.last().is_last_row && !result.last().is_last_column) {
                var last = result.last();

                result.add(last.top_right());
            }
        }


        if(!start.is_last_row && !start.is_first_column) {
            result.add(start.top_left());

            while(!result.last().is_last_row && !result.last().is_first_column) {
                var last = result.last();

                result.add(last.top_left());
            }
        }


        if(!start.is_first_row && !start.is_last_column) {
            result.add(start.bottom_right());

            while(!result.last().is_first_row && !result.last().is_last_column) {
                var last = result.last();

                result.add(last.bottom_right());
            }
        }


        if(!start.is_first_row && !start.is_first_column) {
            result.add(start.bottom_left());

            while(!result.last().is_first_row && !result.last().is_first_column) {
                var last = result.last();

                result.add(last.bottom_left());
            }
        }

        return result;
    }

}
