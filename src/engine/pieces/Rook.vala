public class Rook : Piece {

    public Rook(Piece.Colour colour) {
        base(colour);
    }



    public override string symbol_resource() {
        return base.colour == Piece.Colour.White ?
        "/com/github/retsef/chess/pieces/RookW.png" :
        "/com/github/retsef/chess/pieces/RookB.png";
    }

    public override List<Coordinate> movement(Coordinate start) {
        var result = new List<Coordinate>();



        return result;
    }

}
