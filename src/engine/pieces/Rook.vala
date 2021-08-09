using Gee;

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

    public override Piece clone() {
        return new Rook(this.colour);
    }

    public override string to_string() {
        return "Rook " + base.colour.to_string();
    }

    public override Gee.List<Coordinate> movement(Coordinate start) {
        var result = new ArrayList<Coordinate>();

        if(!start.is_last_row) {
            result.add(start.top());

            while(!result.last().is_last_row) {
                var last = result.last();

                result.add(last.top());
            }
        }

        if(!start.is_first_row) {
            result.add(start.bottom());

            while(!result.last().is_first_row) {
                var last = result.last();

                result.add(last.bottom());
            }
        }


        if(!start.is_last_column) {
            result.add(start.right());

            while(!result.last().is_last_column) {
                var last = result.last();

                result.add(last.right());
            }
        }


        if(!start.is_first_column) {
            result.add(start.left());

            while(!result.last().is_first_column) {
                var last = result.last();

                result.add(last.left());
            }
        }

        return result;
    }

}
