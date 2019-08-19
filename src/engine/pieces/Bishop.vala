public class Bishop : Piece {

    public Bishop(Piece.Colour colour) {
        base(colour);
    }



    public override string symbol_resource() {
        return base.colour == Piece.Colour.White ?
        "/com/github/retsef/chess/pieces/BishopW.png" :
        "/com/github/retsef/chess/pieces/BishopB.png";
    }

    public override List<Coordinate> movement(Coordinate start) {
        var result = new List<Coordinate>();

        return result;
    }

}
