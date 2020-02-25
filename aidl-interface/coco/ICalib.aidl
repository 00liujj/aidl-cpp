
package coco;

import coco.ISensorListener;
import coco.CalibData;

interface ICalib {
  void SetVanishingPoint(float x, float y);
  void GetVanishingPoint(out CalibData d);
  double Compute(int a);
  //double Compute2(in SimpleParcelable sp);
}
