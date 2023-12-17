precision mediump float;
uniform vec3 uColor[2];
varying vec2 vUv;
varying float vElevation;

void main() {
    vec3 color;
    float shade = vElevation * 2.0 + 0.8;
    if (vUv.y < 0.5) {
        color = uColor[0];
    } else {
        color = uColor[1];
    }

    gl_FragColor = vec4(color * shade, 1.0);
}