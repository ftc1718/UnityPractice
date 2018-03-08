// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

Shader"Unlit/Chapter5_ColorView"
{
    Properties
    {
        _Color("Color Tint", Color) = (1.0, 1.0, 1.0, 1.0)
    }
    SubShader
    {
        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag

            #include "UnityCG.cginc"

            uniform fixed4 _Color; //the keyword 'uniform' can be omitted in unity

            struct fragmentData
            {
                float4 position : SV_POSITION;
                fixed4 color : COLOR;
            };

            fragmentData vert(appdata_full v)
            {
                fragmentData frag;
                frag.position = UnityObjectToClipPos(v.vertex);
//                frag.color = fixed4(v.normal * 0.5 + fixed3(0.5, 0.5, 0.5), 1.0); // change vertex normal value to (0, 1)

//				frag.color = fixed4(v.tangent * 0.5 + fixed3(0.5, 0.5, 0.5), 1.0);

                frag.color = fixed4(v.texcoord.xy, 0.0, 1.0); 
 //               frag.color = fixed4(v.texcoord1.xy, 0.0, 1.0); 
//                frag.color = v.color;
				//frag.color = fixed4
            
                return frag;
            }

            fixed4 frag(fragmentData i) : COLOR
            {
                return i.color;
            }

            // float4 vert(float4 v : POSITION/*input*/) : SV_POSITION/* modify return value.output*/
            // {
            //     return UnityObjectToClipPos(v);
            // }

            // fixed4 frag() : SV_Target
            // {
            //     return fixed4(0.0, 1.0, 1.0, 1.0);
            // }


            ENDCG
        }
    }
}
