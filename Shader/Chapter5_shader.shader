Shader"Unlit/Chapter5_shader"
{
    SubShader
    {
        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag

            float4 vert(float4 v : POSITION/*input*/) : SV_POSITION/*output*/
            {
                return UnityObjectToClipPos(v);
            }

            fixed4 frag() : SV_Target
            {
                return fixed4(0.0, 1.0, 1.0, 1.0);
            }
            ENDCG
        }
    }
}
