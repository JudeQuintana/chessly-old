function buildViewer(pgn){

  new PgnViewer(
    { boardName: "demo",
      pgnString: pgn,
      pieceSet: 'merida',
      pieceSize: 65,
      highlightFromTo: true,
      showCoordinates: true,
      pauseBetweenMoves: 2000,
      moveAnimationLength: .3,
      disableFlipper:true
//        movesFormat: "main_on_own_line"
//        autoScrollMoves: true,
      //showBracketsOnVariation: false,
//        hideBracketsOnTopLevelVariation: true,
//        canPasteFen: true,
//        previewMode: true,
//        soundEnabled: false
//        puzzle: true
//        showNPS: true
//        newlineForEachMainMove: false
    }
  );

}
