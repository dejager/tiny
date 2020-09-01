#include <metal_stdlib>
using namespace metal;

kernel void textile(texture2d<float, access::write> o[[texture(0)]],
                 constant float &time [[buffer(0)]],
                 constant float2 *touchEvent [[buffer(1)]],
                 constant int &numberOfTouches [[buffer(2)]],
                 ushort2 gid [[thread_position_in_grid]]) {
  // Two line pattern machine.
  float2 p = float2(gid) - float2(o.get_width(), o.get_height()) * 0.5;
  o.write(sin(float4(2.0, 4.0, 8.0, 1.0) * (dot(p * 0.5, p * 0.5) - time)), gid);
}
