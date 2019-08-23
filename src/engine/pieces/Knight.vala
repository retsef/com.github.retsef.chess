public class Knight : Piece {

    public Knight(Piece.Colour colour) {
        base(colour);
    }


    public override string symbol_resource() {
        return base.colour == Piece.Colour.White ?
        "/com/github/retsef/chess/pieces/KnightW.png" :
        "/com/github/retsef/chess/pieces/KnightB.png";
    }

    public override List<Coordinate> movement(Coordinate start) {
        var result = new List<Coordinate>();



        return result;
    }

}
