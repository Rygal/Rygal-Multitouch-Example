package;

import nme.display.Sprite;
import nme.Lib;
import nme.events.Event;

import org.rygal.Game;
import scenes.MainScene;

/**
 * ...
 * @author Christopher Kaster
 */
class RygalMultitouchExample extends Sprite {

	public function new() {
		super();
		#if iphone
		Lib.current.stage.addEventListener(Event.RESIZE, init);
		#else
		addEventListener(Event.ADDED_TO_STAGE, init);
		#end
	}

	private function init(e) {
		var game:Game = new Game(stage.stageWidth, stage.stageHeight,
			1, new MainScene());

		stage.addChild(game.getDisplayObject());
	}

	static public function main() {
		var stage = Lib.current.stage;
		stage.scaleMode = nme.display.StageScaleMode.NO_SCALE;
		stage.align = nme.display.StageAlign.TOP_LEFT;

		Lib.current.addChild(new RygalMultitouchExample());
	}

}
