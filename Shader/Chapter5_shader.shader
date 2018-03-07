Shader"Unlit/Chapter5_shader"
{
    SubShader
    {
        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag

            struct vertexData
            {
                float4 position : POSITION;
                float4 normal : NORMAL;
                float4 texcoord : TEXCOORD0;
            };

            struct fragmentData
            {
                float4 position : SV_POSITION;
                fixed4 color : COLOR0;
            };

            float4 vert(float4 v : POSITION/*input*/) : SV_POSITION/* modify return value.output*/
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
