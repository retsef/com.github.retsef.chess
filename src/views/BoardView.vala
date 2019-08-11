public class BoardView : Gtk.Grid {

    construct {

        for(int i=0, imax=7; i<imax; i++){
            for(int j=0, jmax=7; j<jmax; j++) {

                var coord = new Coordinate(
                        Coordinate.Row.all()[i],
                        Coordinate.Column.all()[j]
                    );
                this.attach(new BoardBoxView(coord), i, j);
            }
        }

    }

} 
