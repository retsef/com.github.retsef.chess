public class Queen : Piece {

    public Queen(Piece.Colour colour) {
        base(colour);
    }



    public override string symbol_resource() {
        return base.colour == Piece.Colour.White ?
        "/com/github/retsef/chess/pieces/QueenW.png" :
        "/com/github/retsef/chess/pieces/QueenB.png";
    }

    public override List<Coordinate> movement(Coordinate start) {
        var result = new List<Coordinate>();

        return result;
    }

}
