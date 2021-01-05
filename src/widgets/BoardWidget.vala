using Gee;

[GtkTemplate (ui="/com/github/retsef/chess/widgets/board_widget.ui")]
public class BoardView : Gtk.Grid {

    [GtkChild]
    BoardBoxWidget CA_R8;
    [GtkChild]
    BoardBoxWidget CA_R7;
    [GtkChild]
    BoardBoxWidget CA_R6;
    [GtkChild]
    BoardBoxWidget CA_R5;
    [GtkChild]
    BoardBoxWidget CA_R4;
    [GtkChild]
    BoardBoxWidget CA_R3;
    [GtkChild]
    BoardBoxWidget CA_R2;
    [GtkChild]
    BoardBoxWidget CA_R1;

    [GtkChild]
    BoardBoxWidget CB_R8;
    [GtkChild]
    BoardBoxWidget CB_R7;
    [GtkChild]
    BoardBoxWidget CB_R6;
    [GtkChild]
    BoardBoxWidget CB_R5;
    [GtkChild]
    BoardBoxWidget CB_R4;
    [GtkChild]
    BoardBoxWidget CB_R3;
    [GtkChild]
    BoardBoxWidget CB_R2;
    [GtkChild]
    BoardBoxWidget CB_R1;

    [GtkChild]
    BoardBoxWidget CC_R8;
    [GtkChild]
    BoardBoxWidget CC_R7;
    [GtkChild]
    BoardBoxWidget CC_R6;
    [GtkChild]
    BoardBoxWidget CC_R5;
    [GtkChild]
    BoardBoxWidget CC_R4;
    [GtkChild]
    BoardBoxWidget CC_R3;
    [GtkChild]
    BoardBoxWidget CC_R2;
    [GtkChild]
    BoardBoxWidget CC_R1;

    [GtkChild]
    BoardBoxWidget CD_R8;
    [GtkChild]
    BoardBoxWidget CD_R7;
    [GtkChild]
    BoardBoxWidget CD_R6;
    [GtkChild]
    BoardBoxWidget CD_R5;
    [GtkChild]
    BoardBoxWidget CD_R4;
    [GtkChild]
    BoardBoxWidget CD_R3;
    [GtkChild]
    BoardBoxWidget CD_R2;
    [GtkChild]
    BoardBoxWidget CD_R1;

    [GtkChild]
    BoardBoxWidget CE_R8;
    [GtkChild]
    BoardBoxWidget CE_R7;
    [GtkChild]
    BoardBoxWidget CE_R6;
    [GtkChild]
    BoardBoxWidget CE_R5;
    [GtkChild]
    BoardBoxWidget CE_R4;
    [GtkChild]
    BoardBoxWidget CE_R3;
    [GtkChild]
    BoardBoxWidget CE_R2;
    [GtkChild]
    BoardBoxWidget CE_R1;

    [GtkChild]
    BoardBoxWidget CF_R8;
    [GtkChild]
    BoardBoxWidget CF_R7;
    [GtkChild]
    BoardBoxWidget CF_R6;
    [GtkChild]
    BoardBoxWidget CF_R5;
    [GtkChild]
    BoardBoxWidget CF_R4;
    [GtkChild]
    BoardBoxWidget CF_R3;
    [GtkChild]
    BoardBoxWidget CF_R2;
    [GtkChild]
    BoardBoxWidget CF_R1;

    [GtkChild]
    BoardBoxWidget CG_R8;
    [GtkChild]
    BoardBoxWidget CG_R7;
    [GtkChild]
    BoardBoxWidget CG_R6;
    [GtkChild]
    BoardBoxWidget CG_R5;
    [GtkChild]
    BoardBoxWidget CG_R4;
    [GtkChild]
    BoardBoxWidget CG_R3;
    [GtkChild]
    BoardBoxWidget CG_R2;
    [GtkChild]
    BoardBoxWidget CG_R1;

    [GtkChild]
    BoardBoxWidget CH_R8;
    [GtkChild]
    BoardBoxWidget CH_R7;
    [GtkChild]
    BoardBoxWidget CH_R6;
    [GtkChild]
    BoardBoxWidget CH_R5;
    [GtkChild]
    BoardBoxWidget CH_R4;
    [GtkChild]
    BoardBoxWidget CH_R3;
    [GtkChild]
    BoardBoxWidget CH_R2;
    [GtkChild]
    BoardBoxWidget CH_R1;

    construct {

    }

    public void set_piece_in(Piece piece, Coordinate coordinate) {
        var btn = this.get_box(coordinate);
        if(btn == null) return;

        btn.set_piece(piece);
    }

    public BoardBoxWidget get_box(Coordinate coordinate) {
        switch(coordinate.column) {
            case Coordinate.Column.CA: switch(coordinate.row) {
                case Coordinate.Row.R1: return this.CA_R1;
                case Coordinate.Row.R2: return this.CA_R2;
                case Coordinate.Row.R3: return this.CA_R3;
                case Coordinate.Row.R4: return this.CA_R4;
                case Coordinate.Row.R5: return this.CA_R5;
                case Coordinate.Row.R6: return this.CA_R6;
                case Coordinate.Row.R7: return this.CA_R7;
                case Coordinate.Row.R8: return this.CA_R8;
                default: return null;
            }
            case Coordinate.Column.CB: switch(coordinate.row) {
                case Coordinate.Row.R1: return this.CB_R1;
                case Coordinate.Row.R2: return this.CB_R2;
                case Coordinate.Row.R3: return this.CB_R3;
                case Coordinate.Row.R4: return this.CB_R4;
                case Coordinate.Row.R5: return this.CB_R5;
                case Coordinate.Row.R6: return this.CB_R6;
                case Coordinate.Row.R7: return this.CB_R7;
                case Coordinate.Row.R8: return this.CB_R8;
                default: return null;
            }
            case Coordinate.Column.CC: switch(coordinate.row) {
                case Coordinate.Row.R1: return this.CC_R1;
                case Coordinate.Row.R2: return this.CC_R2;
                case Coordinate.Row.R3: return this.CC_R3;
                case Coordinate.Row.R4: return this.CC_R4;
                case Coordinate.Row.R5: return this.CC_R5;
                case Coordinate.Row.R6: return this.CC_R6;
                case Coordinate.Row.R7: return this.CC_R7;
                case Coordinate.Row.R8: return this.CC_R8;
                default: return null;
            }
            case Coordinate.Column.CD: switch(coordinate.row) {
                case Coordinate.Row.R1: return this.CD_R1;
                case Coordinate.Row.R2: return this.CD_R2;
                case Coordinate.Row.R3: return this.CD_R3;
                case Coordinate.Row.R4: return this.CD_R4;
                case Coordinate.Row.R5: return this.CD_R5;
                case Coordinate.Row.R6: return this.CD_R6;
                case Coordinate.Row.R7: return this.CD_R7;
                case Coordinate.Row.R8: return this.CD_R8;
                default: return null;
            }
            case Coordinate.Column.CE: switch(coordinate.row) {
                case Coordinate.Row.R1: return this.CE_R1;
                case Coordinate.Row.R2: return this.CE_R2;
                case Coordinate.Row.R3: return this.CE_R3;
                case Coordinate.Row.R4: return this.CE_R4;
                case Coordinate.Row.R5: return this.CE_R5;
                case Coordinate.Row.R6: return this.CE_R6;
                case Coordinate.Row.R7: return this.CE_R7;
                case Coordinate.Row.R8: return this.CE_R8;
                default: return null;
            }
            case Coordinate.Column.CF: switch(coordinate.row) {
                case Coordinate.Row.R1: return this.CF_R1;
                case Coordinate.Row.R2: return this.CF_R2;
                case Coordinate.Row.R3: return this.CF_R3;
                case Coordinate.Row.R4: return this.CF_R4;
                case Coordinate.Row.R5: return this.CF_R5;
                case Coordinate.Row.R6: return this.CF_R6;
                case Coordinate.Row.R7: return this.CF_R7;
                case Coordinate.Row.R8: return this.CF_R8;
                default: return null;
            }
            case Coordinate.Column.CG: switch(coordinate.row) {
                case Coordinate.Row.R1: return this.CG_R1;
                case Coordinate.Row.R2: return this.CG_R2;
                case Coordinate.Row.R3: return this.CG_R3;
                case Coordinate.Row.R4: return this.CG_R4;
                case Coordinate.Row.R5: return this.CG_R5;
                case Coordinate.Row.R6: return this.CG_R6;
                case Coordinate.Row.R7: return this.CG_R7;
                case Coordinate.Row.R8: return this.CG_R8;
                default: return null;
            }
            case Coordinate.Column.CH: switch(coordinate.row) {
                case Coordinate.Row.R1: return this.CH_R1;
                case Coordinate.Row.R2: return this.CH_R2;
                case Coordinate.Row.R3: return this.CH_R3;
                case Coordinate.Row.R4: return this.CH_R4;
                case Coordinate.Row.R5: return this.CH_R5;
                case Coordinate.Row.R6: return this.CH_R6;
                case Coordinate.Row.R7: return this.CH_R7;
                case Coordinate.Row.R8: return this.CH_R8;
                default: return null;
            }
            default: return null;
        }
    }
}

