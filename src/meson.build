# Create a new executable, list the files we want to compile, list the dependencies we need, and install
executable(
    meson.project_name(),
    'Application.vala',
    # Primitives
    'engine/Coordinate.vala',
    # Engine
    'engine/BoardEngine.vala',
    # Pieces
    'engine/pieces/Piece.vala',
    'engine/pieces/Pawn.vala',
    'engine/pieces/Rook.vala',
    'engine/pieces/Knight.vala',
    'engine/pieces/Bishop.vala',
    'engine/pieces/King.vala',
    'engine/pieces/Queen.vala',
    # Views
    'views/BoardView.vala',
    'views/BoardBoxView.vala',

    chess_resources,
    dependencies: [
        dependency('gtk+-3.0'),
        dependency('gmodule-2.0'),
        dependency('glib-2.0'),
        dependency('gobject-2.0'),
        dependency('gee-0.8'),
        #dependency('granite', version: '>=5.2.0')
    ],
    install: true
)
