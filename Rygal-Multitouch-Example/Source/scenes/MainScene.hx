/*

Copyright (c) 2012 Christopher "Kasoki" Kaster

Permission is hereby granted, free of charge, to any person
obtaining a copy of this software and associated documentation
files (the "Software"), to deal in the Software without restriction,
including without limitation the rights to use, copy, modify, merge,
publish, distribute, sublicense, and/or sell copies of the Software,
and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.

*/
package scenes;

import nme.events.Event;
import nme.Lib;
import org.rygal.graphic.Sprite;
import org.rygal.graphic.Texture;
import org.rygal.graphic.Canvas;
import org.rygal.Game;
import org.rygal.GameTime;
import org.rygal.graphic.Canvas;
import org.rygal.Scene;

import org.rygal.input.TouchEvent;

/**
 *
 * @author Christopher Kaster
 */

class MainScene extends Scene {

	private var touches:IntHash<Sprite>;
	private var texture:Texture;

	public function new() {
		super();
	}

	override public function load(game:Game):Void {
		super.load(game);
		
		touches = new IntHash<Sprite>();
		texture = Texture.fromAssets("assets/Octocat.png");
		
		game.touch.addEventListener(TouchEvent.TOUCH_BEGIN, onTouchBegin);
		game.touch.addEventListener(TouchEvent.TOUCH_MOVE, onTouchMove);
		game.touch.addEventListener(TouchEvent.TOUCH_END, onTouchEnd);
	}

	public function onTouchBegin(e:TouchEvent) {
		trace("Touch begin");
		
		var touchSprite:Sprite = new Sprite(texture);

		touchSprite.x = e.x - texture.width/2;
		touchSprite.y = e.y - texture.width/2;

		touches.set(e.touchPointID, touchSprite);
	}
	
	public function onTouchMove(e:TouchEvent) {
		trace("Touch move: x:" + e.x + ", y: " + e.y);
		
		var sprite:Sprite = touches.get(e.touchPointID);
		
		sprite.x = e.x - texture.width/2;
		sprite.y = e.y - texture.width/2;
	}

	public function onTouchEnd(e:TouchEvent) {
		trace("Touch end");
		
		var sprite:Sprite = touches.get(e.touchPointID);
		
		touches.remove(e.touchPointID);
	}

	override public function unload():Void {
		super.unload();

	}

	override public function update(time:GameTime):Void {
		super.update(time);

	}
	
	override public function draw(screen:Canvas):Void {
		screen.clear();
		
		super.draw(screen);
		
		for(sprite in touches) {
			if(sprite != null) {
				sprite.draw(screen);
			}
		}
	}
}