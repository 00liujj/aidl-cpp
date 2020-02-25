#include "coco/BnSensorData.h"
#include <utils/Mutex.h>

namespace coco {

using namespace android;
class BnSensorDataImpl : public BnSensorData , public IBinder::DeathRecipient {
    Vector<sp<::coco::ISensorListener> > mListeners;
    Mutex                           mLock;

    float mSpeed;
    double mGpsX, mGpsY, mGpsZ;
public:
    virtual ::android::status_t SetSpeed(float v) {
        mSpeed = v;

        Mutex::Autolock _l(mLock);
        for (size_t i = 0; i < mListeners.size(); i++) {
            mListeners[i]->OnSpeedChanged(mSpeed);
        }
        return OK;
    }
    virtual ::android::status_t SetGPS(double x, double y, double z) {
        mGpsX = x;
        mGpsY = y;
        mGpsZ = z;

        Mutex::Autolock _l(mLock);
        for (size_t i = 0; i < mListeners.size(); i++) {
            mListeners[i]->OnGPSChanged(mGpsX, mGpsY, mGpsZ);
        }
        return OK;
    }
    virtual ::android::status_t
    registerListener(const ::android::sp<::coco::ISensorListener> &listener)  {

        if (listener == NULL) {
            return BAD_VALUE;
        }
        Mutex::Autolock _l(mLock);

        // check whether this is a duplicate
        for (size_t i = 0; i < mListeners.size(); i++) {
            if (IInterface::asBinder(mListeners[i]) == IInterface::asBinder(listener)) {
                return ALREADY_EXISTS;
            }
        }

        mListeners.add(listener);
        IInterface::asBinder(listener)->linkToDeath(this);
        return OK;

    }
    virtual ::android::status_t
    unregisterListener(const ::android::sp<::coco::ISensorListener> &listener) {
        if (listener == NULL) {
            return BAD_VALUE;
        }
        Mutex::Autolock _l(mLock);
        for (size_t i = 0; i < mListeners.size(); i++) {
            if (IInterface::asBinder(mListeners[i]) == IInterface::asBinder(listener)) {
                IInterface::asBinder(mListeners[i])->unlinkToDeath(this);
                mListeners.removeAt(i);
                break;
            }
        }
        return OK;
    }
};


}
