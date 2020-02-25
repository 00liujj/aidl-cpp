
package coco;

import coco.ISensorListener;

interface ISensorData {
  void SetSpeed(float v);
  void SetGPS(double x, double y, double z);
  void SetAccel(float x, float y, float z);
  void SetGyro(float x, float y, float z);
  void registerListener(ISensorListener l);
  void unregisterListener(ISensorListener l);
}
