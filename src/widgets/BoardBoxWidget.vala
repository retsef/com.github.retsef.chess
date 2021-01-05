[GtkTemplate (ui="/com/github/retsef/chess/widgets/board_box_widget.ui")]
public class BoardBoxWidget : Gtk.Button {
    public Coordinate coordinate;
    public Piece piece;

    [GtkChild]
    Gtk.Image image;

    construct {

    }

    // public BoardBoxView(Coordinate coord) {
    //     this.coordinate = coord;
    // }

    public void set_piece(Piece piece) {
        this.piece = piece;

        image.set_from_resource(piece.symbol_resource());
    }

    public void remove_piece() {
        this.piece = null;

        image.set_from_resource(null);
    }

}

