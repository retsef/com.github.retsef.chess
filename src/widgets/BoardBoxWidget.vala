[GtkTemplate (ui="/com/github/retsef/chess/widgets/board_box_widget.ui")]
public class BoardBoxWidget : Gtk.Button {
    // public Coordinate coordinate;

    public string coordinate_column { get; set; }
    public string coordinate_row { get; set; }

    public Piece piece;

    [GtkChild]
    Gtk.Image image;

    construct {
        // stdout.printf ("%s", this.coordinate_row + this.coordinate_column);
    }

    // public BoardBoxView(Coordinate coord) {
    //     this.coordinate = coord;
    // }


    public Coordinate get_coordinate() {
        return new Coordinate(
                Coordinate.Row.from_string(this.coordinate_row),
                Coordinate.Column.from_string(this.coordinate_column));
    }

    public void set_piece(Piece piece) {
        this.piece = piece;

        image.set_from_resource(piece.symbol_resource());
    }

    public void remove_piece() {
        this.piece = null;

        image.set_from_resource(null);
    }

}

