
package coco;

interface ISensorListener {
  void OnSpeedChanged(float v);
  void OnGPSChanged(double x, double y, double z);
}
