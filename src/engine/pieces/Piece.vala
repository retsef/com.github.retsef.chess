using Gee;

public abstract class Piece : Object {
    public enum Colour {
        White, Black;

        public string to_string() {
            switch (this) {
                case White: return "White";
                case Black: return "Black";
                default: assert_not_reached();
            }
        }

        public static Colour[] all() {
            return { White, Black };
        }
    }


    public Colour colour;

    // public Piece(Colour colour) {
    //  this.colour = colour;
    // }

    public abstract string symbol_resource();

    public abstract Gee.List<Coordinate> movement(Coordinate start);

    public abstract Piece clone();

    public abstract string to_string();

}
