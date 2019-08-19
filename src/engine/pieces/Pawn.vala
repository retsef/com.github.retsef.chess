public class Pawn : Piece{

    public Pawn(Piece.Colour colour) {
        base(colour);
    }


    public override string symbol_resource() {
        return base.colour == Piece.Colour.White ?
        "/com/github/retsef/chess/pieces/PawnW.png" :
        "/com/github/retsef/chess/pieces/PawnB.png";
    }

    public override List<Coordinate> movement(Coordinate start) {
        var result = new List<Coordinate>();

        return result;
    }

}
