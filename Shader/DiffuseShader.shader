Shader "Unlit/DiffuseShader"
{
	Properties
	{
		_ObjectColor ("ObjectColor", Color) = (1, 1, 1, 1)
	}
	SubShader
	{
		Pass
		{
			Tags {"LightMode" = "ForwardBase"}

			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag

			#include "Lighting.cginc"

			float4 _ObjectColor;

			struct a2v
			{
				float4 position : POSITION;
				float3 normal : NORMAL;
			};

			struct v2f
			{
				float4 position : SV_POSITION;
				float4 color : COLOR;
			};

			//if need to retunr POSITION

			float4 vert(a2v v) : COLOR
			{
				v2f output;
				output.position = UnityObjectToClipPos(v.position);
				//get ambient
				fixed4 ambient = UNITY_LIGHTMODE_AMBIENT;

				float3 normal = normalize(v.normal);

				float4 lightDir = normalize(_WorldSpaceLightPos0);
				output.color = ambient + 
				return output.color;
			}
			ENDCG
		}
	}
}
