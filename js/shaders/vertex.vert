varying vec2 vUv;
varying float vElevation;
uniform float time;

uniform mat4 projectionMatrix;
uniform mat4 viewMatrix;
uniform mat4 modelMatrix;

attribute vec3 position;
attribute vec2 uv;


void main() {
    vec4 modelPosition = modelMatrix * vec4(position, 1.0);
    float waveX1 = sin(modelPosition.x * 10.0 + time * 3.0) * 0.1;
    float waveX2 = sin(modelPosition.x * 3.0 + time * 2.0) * 0.05;
    float waveY1 = sin(modelPosition.y * 10.0 + time * 0.5) * 0.1;
    
    float multi = (modelPosition.x + 0.5) / 1.4;

    float elevation = (waveX1 + waveX2 + waveY1) * multi;
    modelPosition.z = elevation;

    gl_Position = projectionMatrix * viewMatrix * modelPosition;

    vUv = uv;
    vElevation = elevation;
}
