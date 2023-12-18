precision mediump float;
uniform vec3 uColor[2];
varying vec2 vUv;
varying float vElevation;

void main() {
    float shade = vElevation * 2.0 + 0.8;
    vec3 color = mix(uColor[0], uColor[1], step(0.5, vUv.y));
    gl_FragColor = vec4(color * shade, 1.0);
}