/*
* Copyright (c) 2011-2018 Your Organization (https://yourwebsite.com)
*
* This program is free software; you can redistribute it and/or
* modify it under the terms of the GNU General Public
* License as published by the Free Software Foundation; either
* version 2 of the License, or (at your option) any later version.
*
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
* General Public License for more details.
*
* You should have received a copy of the GNU General Public
* License along with this program; if not, write to the
* Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
* Boston, MA 02110-1301 USA
*
* Authored by: Roberto Scinocca <roberto.scinnocca@gmail.com>
*/

public class ChessApp : Gtk.Application {

    public ChessApp() {
        Object (
            application_id: "com.github.retsef.chess",
            flags: ApplicationFlags.FLAGS_NONE
        );
    }

    protected override void activate () {
        try {
            // If the UI contains custom widgets, their types must've been instantiated once
            // Type type = typeof(Foo.BarEntry);
            // assert(type != 0);
            var builder = new Gtk.Builder();
            builder.add_from_file("/com/github/retsef/chess/chess.ui");
            builder.connect_signals(null);

            var window = builder.get_object("window") as Gtk.Window;
            window.show_all();

            //Gtk.main();
        } catch (Error e) {
            stderr.printf ("Could not load UI: %s\n", e.message);
            return;
        }

        /*
        var main_window = new Gtk.ApplicationWindow(this);
        main_window.default_height = 625;
        main_window.default_width = 850;
        main_window.title = "Chess";


        // Container
        var container = new Gtk.Layout();
        //container.background("#00FF00");

        var background = new Gtk.Image.from_file("./assets/background.png");
        container.add(background);

        var grid = new BoardView();
        container.add(grid);

        main_window.add(container);
        main_window.show_all();
        */
    }


    public static int main (string[] args) {
        var app = new ChessApp();
        return app.run(args);
    }

}
