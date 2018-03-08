Shader"Unlit/Chapter5_shader"
{
    Properties
    {
//        _Color("Color Tint", Color) = (1.0, 1.0, 1.0, 1.0)
    }
    SubShader
    {
        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag

            fixed4 _Color;

            float4 vert(float4 v : POSITION/*input*/) : SV_POSITION/* modify return value.output*/
            {
                return UnityObjectToClipPos(v);
            }

            fixed4 frag() : SV_Target
            {
                return _Color;
            }


            ENDCG
        }
    }
}
