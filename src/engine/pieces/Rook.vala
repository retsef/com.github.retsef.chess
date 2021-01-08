public class Rook : Piece {

    public Rook(Piece.Colour colour) {
        // base(colour);
        this.colour = colour;
    }


    public override string symbol_resource() {
        return base.colour == Piece.Colour.White ?
        "/com/github/retsef/chess/pieces/RookW.png" :
        "/com/github/retsef/chess/pieces/RookB.png";
    }

    public override string to_string() {
        return "Rook " + base.colour.to_string();
    }

    public override List<Coordinate> movement(Coordinate start) {
        var result = new List<Coordinate>();

        if(!start.is_last_row) {
            result.append(start.top());

            while(!result.last().data.is_last_row) {
                var last = result.last().data;

                result.append(last.top());
            }
        }

        if(!start.is_first_row) {
            result.append(start.bottom());

            while(!result.last().data.is_first_row) {
                var last = result.last().data;

                result.append(last.bottom());
            }
        }


        if(!start.is_last_column) {
            result.append(start.right());

            while(!result.last().data.is_last_column) {
                var last = result.last().data;

                result.append(last.right());
            }
        }


        if(!start.is_first_column) {
            result.append(start.left());

            while(!result.last().data.is_first_column) {
                var last = result.last().data;

                result.append(last.left());
            }
        }

        return result;
    }

}
