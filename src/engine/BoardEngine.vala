using Gee;

public class BoardEngine {
    public Gtk.Grid board;
    public HashMap<Coordinate, Piece> battlefield;

    public BoardEngine(Gtk.Grid board) {
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
            new Coordinate(Coordinate.Row.RA, Coordinate.Column.C1),
            new Rook(colour)
        );
        battlefield.set(
            new Coordinate(Coordinate.Row.RA, Coordinate.Column.C8),
            new Rook(colour)
        );
        //Knights
        battlefield.set(
            new Coordinate(Coordinate.Row.RA, Coordinate.Column.C2),
            new Knight(colour)
        );
        battlefield.set(
            new Coordinate(Coordinate.Row.RA, Coordinate.Column.C7),
            new Knight(colour)
        );
        //Bishops
        battlefield.set(
            new Coordinate(Coordinate.Row.RA, Coordinate.Column.C3),
            new Bishop(colour)
        );
        battlefield.set(
            new Coordinate(Coordinate.Row.RA, Coordinate.Column.C6),
            new Bishop(colour)
        );

        //King
        //Queen

        //Pawns
        foreach(var column in Coordinate.Column.all()) {
            battlefield.set(
                new Coordinate(Coordinate.Row.RB, column),
                new Pawn(colour)
            );
        }
    }


    private void place_player_1(Piece.Colour colour) {
        //Rooks
        battlefield.set(
            new Coordinate(Coordinate.Row.RH, Coordinate.Column.C1),
            new Rook(colour)
        );
        battlefield.set(
            new Coordinate(Coordinate.Row.RH, Coordinate.Column.C8),
            new Rook(colour)
        );
        //Knights
        battlefield.set(
            new Coordinate(Coordinate.Row.RH, Coordinate.Column.C2),
            new Knight(colour)
        );
        battlefield.set(
            new Coordinate(Coordinate.Row.RH, Coordinate.Column.C7),
            new Knight(colour)
        );
        //Bishops
        battlefield.set(
            new Coordinate(Coordinate.Row.RH, Coordinate.Column.C3),
            new Bishop(colour)
        );
        battlefield.set(
            new Coordinate(Coordinate.Row.RH, Coordinate.Column.C6),
            new Bishop(colour)
        );

        //King
        //Queen

        //Pawns
        foreach(var column in Coordinate.Column.all()) {
            battlefield.set(
                new Coordinate(Coordinate.Row.RG, column),
                new Pawn(colour)
            );
        }
    }


    public void draw() {
        foreach (var entry in battlefield.entries) {
            //stdout.printf ("%s => %d\n", entry.key, entry.value);
            var coordinate = entry.key;
            var piece = entry.value;
            var btn = board.get_child_at(coordinate.column, coordinate.row) as Gtk.Button;

            var image = new Gtk.Image.from_resource(piece.symbol_resource());
            image.set_size_request(10,10);

            btn.set_image(image);

        }
    }

}
