using Gee;

public class BoardEngine {
    public BoardView board;
    public HashMap<Coordinate, Piece> battlefield;

    public BoardEngine(BoardView board) {
        this.board = board;

        battlefield = new HashMap<Coordinate, Piece>();
    }


    public void start() {
        place_player_1(Piece.Colour.White);
        place_player_2(Piece.Colour.Black);

        draw();
    }

    public void reset() {
        battlefield.clear();
    }


    private void place_player_2(Piece.Colour colour) {
        //Rooks
        battlefield.set(
            new Coordinate(Coordinate.Row.R8, Coordinate.Column.CH),
            new Rook(colour)
        );
        battlefield.set(
            new Coordinate(Coordinate.Row.R8, Coordinate.Column.CA),
            new Rook(colour)
        );
        //Knights
        battlefield.set(
            new Coordinate(Coordinate.Row.R8, Coordinate.Column.CB),
            new Knight(colour)
        );
        battlefield.set(
            new Coordinate(Coordinate.Row.R8, Coordinate.Column.CG),
            new Knight(colour)
        );
        //Bishops
        battlefield.set(
            new Coordinate(Coordinate.Row.R8, Coordinate.Column.CC),
            new Bishop(colour)
        );
        battlefield.set(
            new Coordinate(Coordinate.Row.R8, Coordinate.Column.CF),
            new Bishop(colour)
        );

        //King
        battlefield.set(
            new Coordinate(Coordinate.Row.R8, Coordinate.Column.CE),
            new King(colour)
        );
        //Queen
        battlefield.set(
            new Coordinate(Coordinate.Row.R8, Coordinate.Column.CD),
            new Queen(colour)
        );

        //Pawns
        foreach(var column in Coordinate.Column.all()) {
            battlefield.set(
                new Coordinate(Coordinate.Row.R7, column),
                new Pawn(colour)
            );
        }
    }


    private void place_player_1(Piece.Colour colour) {
        //Rooks
        battlefield.set(
            new Coordinate(Coordinate.Row.R1, Coordinate.Column.CH),
            new Rook(colour)
        );
        battlefield.set(
            new Coordinate(Coordinate.Row.R1, Coordinate.Column.CA),
            new Rook(colour)
        );
        //Knights
        battlefield.set(
            new Coordinate(Coordinate.Row.R1, Coordinate.Column.CB),
            new Knight(colour)
        );
        battlefield.set(
            new Coordinate(Coordinate.Row.R1, Coordinate.Column.CG),
            new Knight(colour)
        );
        //Bishops
        battlefield.set(
            new Coordinate(Coordinate.Row.R1, Coordinate.Column.CC),
            new Bishop(colour)
        );
        battlefield.set(
            new Coordinate(Coordinate.Row.R1, Coordinate.Column.CF),
            new Bishop(colour)
        );

        //King
        battlefield.set(
            new Coordinate(Coordinate.Row.R1, Coordinate.Column.CE),
            new King(colour)
        );
        //Queen
        battlefield.set(
            new Coordinate(Coordinate.Row.R1, Coordinate.Column.CD),
            new Queen(colour)
        );

        //Pawns
        foreach(var column in Coordinate.Column.all()) {
            battlefield.set(
                new Coordinate(Coordinate.Row.R2, column),
                new Pawn(colour)
            );
        }
    }


    public void draw() {
        foreach (var entry in battlefield.entries) {
            stdout.printf ("%s => %s\n", entry.key.to_string(), entry.value.to_string());
            var coordinate = entry.key;
            var piece = entry.value;

            board.set_piece_in(piece, coordinate);
        }
    }

    [CCode (instance_pos = -1)]
    public void on_checkboard_clicked(BoardBoxWidget source) {
        // stdout.printf ("%s => %s\n", entry.key.to_string(), entry.value.to_string());
        stdout.printf ("%s", "clicked!");
    }

}
