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

        return result;
    }

}
