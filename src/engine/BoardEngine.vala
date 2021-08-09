using Gee;

public class BoardEngine {
    public enum State {
        START, WH_MOVE, BK_MOVE, END;

        public State next() {
            if(this == WH_MOVE) return BK_MOVE;
            if(this == BK_MOVE) return WH_MOVE;
            return this;
        }
    }

    private State STATUS;

    public BoardWidget board;
    public HashMap<Coordinate, Piece> battlefield;

    public Piece selected_piece;
    public Coordinate selected_coordinate;
    public ArrayList<Coordinate> piece_possible_moves;
    public ArrayList<Coordinate> piece_possible_eats;

    public BoardEngine(BoardWidget board) {
        this.board = board;

        // this.board.on_board_clicked.connect(this.on_checkboard_clicked);
        this.board.on_box_clicked.connect(this.on_coordinate_select);

        HashDataFunc<Coordinate> keyfunc = (a) => { return a.hash(); };
        EqualDataFunc<Coordinate> eqfunc = (as1, as2) => { return as1.equal_to(as2); };
        this.battlefield = new HashMap<Coordinate, Piece>(keyfunc, eqfunc);

        this.piece_possible_moves = new ArrayList<Coordinate>();
        this.piece_possible_eats = new ArrayList<Coordinate>();
    }


    [HasEmitter]
    [CCode (instance_pos = -1)]
    public void on_new_game(Gtk.Button button) {
        this.start();
    }

    [HasEmitter]
    public void on_coordinate_select(Coordinate coordinate) {
        // stdout.printf ("%s", "clicked!");
        // stdout.printf ("%s => %s\n", coordinate.to_string(), "clicked!");

        if(this.STATUS == State.END) return;

        // Mossa Successiva
        if(this.selected_piece != null && this.selected_coordinate != null) {
            if(this.piece_possible_moves.contains(coordinate)) {
                stdout.printf ("%s from %s to %s\n", this.selected_piece.to_string(), selected_coordinate.to_string(), coordinate.to_string());

                this.battlefield.unset(this.selected_coordinate);
                this.battlefield.set(this.selected_coordinate, this.selected_piece);

                this.board.move_piece_from_to(this.selected_piece, this.selected_coordinate, coordinate);
                this.board.clear_all_moves();


                this.selected_piece = null;
                this.selected_coordinate = null;

                this.STATUS = this.STATUS.next();
                return;
            }


            this.selected_piece = null;
            this.selected_coordinate = null;
        }

        this.board.clear_all_moves();

        var piece = battlefield.get(coordinate);
        if(piece == null) {
            stdout.printf ("Piece not found in %s\n", coordinate.to_string());
            return;
        }

        stdout.printf ("Found %s in %s\n", piece.to_string(), coordinate.to_string());

        if(piece.colour == Piece.Colour.White && this.STATUS != State.WH_MOVE) return;
        if(piece.colour == Piece.Colour.Black && this.STATUS != State.BK_MOVE) return;

        this.selected_coordinate = coordinate;
        this.selected_piece = piece;

        piece_possible_moves.clear();
        piece_possible_moves.add_all(this.selected_piece.movement(coordinate));
        // TODO: aggiungere un modo per oridinare le mosse in direzione rimmuovere i punti cechi

        this.board.show_moves_on(piece_possible_moves);
    }

    [CCode (instance_pos = -1)]
    public void on_checkboard_clicked(BoardBoxWidget source) {
        // stdout.printf ("%s => %s\n", entry.key.to_string(), entry.value.to_string());
        stdout.printf ("%s\n", "clicked!");
        // stdout.printf ("%s => %s", source.get_coordinate().to_string(), "clicked!");

        // this.board.clear_all_moves();
        // source.get_style_context().add_class("move");
    }

    public void start() {
        battlefield.clear();
        board.clear();

        place_player_1(Piece.Colour.White);
        place_player_2(Piece.Colour.Black);

        draw();

        this.STATUS = State.WH_MOVE;
    }

    public void reset() {
        battlefield.clear();
    }


    private void place_player_2(Piece.Colour colour) {
        //Rooks
        battlefield.set( new Coordinate(Coordinate.Row.R8, Coordinate.Column.CH),
            new Rook(colour)
        );
        battlefield.set( new Coordinate(Coordinate.Row.R8, Coordinate.Column.CA),
            new Rook(colour)
        );
        //Knights
        battlefield.set( new Coordinate(Coordinate.Row.R8, Coordinate.Column.CB),
            new Knight(colour)
        );
        battlefield.set( new Coordinate(Coordinate.Row.R8, Coordinate.Column.CG),
            new Knight(colour)
        );
        //Bishops
        battlefield.set( new Coordinate(Coordinate.Row.R8, Coordinate.Column.CC),
            new Bishop(colour)
        );
        battlefield.set( new Coordinate(Coordinate.Row.R8, Coordinate.Column.CF),
            new Bishop(colour)
        );

        //King
        battlefield.set( new Coordinate(Coordinate.Row.R8, Coordinate.Column.CE),
            new King(colour)
        );
        //Queen
        battlefield.set( new Coordinate(Coordinate.Row.R8, Coordinate.Column.CD),
            new Queen(colour)
        );

        //Pawns
        foreach(var column in Coordinate.Column.all()) {
            battlefield.set( new Coordinate(Coordinate.Row.R7, column),
                new Pawn(colour)
            );
        }
    }


    private void place_player_1(Piece.Colour colour) {
        //Rooks
        battlefield.set( new Coordinate(Coordinate.Row.R1, Coordinate.Column.CH),
            new Rook(colour)
        );
        battlefield.set( new Coordinate(Coordinate.Row.R1, Coordinate.Column.CA),
            new Rook(colour)
        );
        //Knights
        battlefield.set( new Coordinate(Coordinate.Row.R1, Coordinate.Column.CB),
            new Knight(colour)
        );
        battlefield.set( new Coordinate(Coordinate.Row.R1, Coordinate.Column.CG),
            new Knight(colour)
        );
        //Bishops
        battlefield.set( new Coordinate(Coordinate.Row.R1, Coordinate.Column.CC),
            new Bishop(colour)
        );
        battlefield.set( new Coordinate(Coordinate.Row.R1, Coordinate.Column.CF),
            new Bishop(colour)
        );

        //King
        battlefield.set( new Coordinate(Coordinate.Row.R1, Coordinate.Column.CE),
            new King(colour)
        );
        //Queen
        battlefield.set( new Coordinate(Coordinate.Row.R1, Coordinate.Column.CD),
            new Queen(colour)
        );

        //Pawns
        foreach(var column in Coordinate.Column.all()) {
            battlefield.set( new Coordinate(Coordinate.Row.R2, column),
                new Pawn(colour)
            );
        }
    }


    public void draw() {
        foreach (var entry in battlefield.entries) {
            var coordinate = entry.key;
            var piece = entry.value;

            board.set_piece_in(piece, coordinate);
        }
    }

}
