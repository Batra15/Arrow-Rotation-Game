# Arrow-Rotation-Game
Rules:
Horizontal mode (When the mobile screen is parallel to the ground. Think when the mobile is lying flat on the table.) :
  - The centre arrow should keep rotating in a clockwise direction.
  - When a person presses any button. The arrow should point to that button until the button is released.
  - When the button is pressed twice (like a double click) but the button is not released at the end of the double click - the arrow should point exactly opposite       to this button until the button is released.
  - When the button is released, the arrow should continue rotating from its current orientation at the time.
  - Race condition: When both buttons have actions. You have to prioritise the button which receives actions first.

 Vertical Mode (When the mobile screen is perpendicular to the ground. Think mobile put flat against a wall).
   - The buttons should get disabled and the arrow should point in the upwards direction (towards the sky - perpendicular to the ground).
