﻿// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

Shader"Unlit/Chapter5_shader"
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

            fixed4 _Color;

            struct vertexData
            {
                float4 position : POSITION;
                float3 normal : NORMAL;
                float4 texcoord : TEXCOORD0;
            };

            struct fragmentData
            {
                float4 position : SV_POSITION;
                fixed4 color : COLOR;
            };

            fragmentData vert(vertexData v)
            {
                fragmentData frag;
                frag.position = UnityObjectToClipPos(v.position);
                frag.color = fixed4(v.normal * 0.5 + fixed3(0.5, 0.5, 0.5), 1.0); // change vertex normal value to (0, 1)
                //frag.color = fixed4(v.normal, 1.0);
            
                return frag;
            }

            fixed4 frag(fragmentData i) : COLOR
            {
               // i.color = fixed4(1, 0, 0, 1);
                i.color *= _Color;
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
