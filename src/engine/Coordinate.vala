public class Coordinate {
    public enum ROW {
        A,B,C,D,E,F,G,H;

        public string toString (){
            return ((EnumClass)typeof (Something).class_ref ()).get_value(this).value_name;
        }
    }

    public ROW row;
    public int column;

    public Coordinate(ROW _row, int _column) {
        this.row = _row;
        this.column = _column;
    }


    public boolean equals(Object obj) {
        if(obj==null)
            return false;
        if(this.getClass()!=obj.getClass())
            return false;

        Coordinate c = (Coordinate) obj;
        return this.toString().equals(c.toString());
    }

    public int hashCode() {
        return this.row.hashCode()+this.column;
    }


    /**
     * Funzioni di confronto
     */
    public boolean isBeforRow(Coordinate c) {
        return isBeforeRow(c.getRow());
    }

    public boolean isAfterRow(Coordinate c) {
        return isAfterRow(c.getRow());
    }

    public boolean isBeforeRow(ROW row) {
        int current_row = this.getRow().ordinal();
        int request_row = row.ordinal();

        return request_row-current_row > 0;
    }

    /*
    public boolean isAfterRow(ROW row) {
        int current_row = this.getRow().ordinal();
        int request_row = row.ordinal();

        return current_row-request_row > 0;
    }
    */

    public boolean isOnFirstRow() {
        return this.getRow().equals(ROW.A);
    }

    public boolean isOnLastRow() {
        return this.getRow().equals(ROW.H);
    }



    public boolean isBeforeColumn(int column) {
        int current_column = this.getColumn();
        int request_column = column;

        return request_column-current_column > 0;
    }

    public boolean isAfterColumn(int column) {
        int current_column = this.column;
        int request_column = column;

        return current_column-request_column > 0;
    }

    /*
    public boolean isBeforeColumn(Coordinate c) {
        return isBeforeColumn(c.column);
    }

    public boolean isAfterColumn(Coordinate c) {
        return isAfterColumn(c.column);
    }
    */

    public boolean isOnFirstColumn() {
        return this.column >= 1;
    }

    public boolean isOnLastColumn() {
        return this.column <= 8;
    }

}
