using Gee;

public class Knight : Piece {

    public Knight(Piece.Colour colour) {
        // base(colour);
        this.colour = colour;
    }


    public override string symbol_resource() {
        return base.colour == Piece.Colour.White ?
        "/com/github/retsef/chess/pieces/KnightW.png" :
        "/com/github/retsef/chess/pieces/KnightB.png";
    }

    public override string to_string() {
        return "Knight " + base.colour.to_string();
    }

    public override Gee.List<Coordinate> movement(Coordinate start) {
        var result = new ArrayList<Coordinate>();



        return result;
    }

}
