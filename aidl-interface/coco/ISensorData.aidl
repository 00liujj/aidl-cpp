
package coco;

import coco.ISensorListener;

interface ISensorData {
  float GetSpeed();
  void SetSpeed(float v);
  //void GetGPS(double*x, double* y, double* z);
  void SetGPS(double x, double y, double z);
  void registerListener(ISensorListener l);
  void unregisterListener(ISensorListener l);
}
