Shader "Unlit/SplitShader"
{
	Properties
	{
		_Point("Center", Vector) = (0, 0, 0, 1.0)
		_DistanceNear("Distance", Float) = 5.0
		_ColorNear("ColorNear", Color) = (1, 0, 0, 1)
		_ColorFar("ColorFar", Color) = (0, 0, 1, 1)
	}

	SubShader
	{
		Pass
		{
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag

			#include "UnityCG.cginc"

			float4 _Point;
			float _DistanceNear;
			float4 _ColorNear;
			float4 _ColorFar;

			struct vertexInput
			{
				float4 position : POSITION;
			};

			struct vertexOutput
			{
				float4 position : SV_POSITION;
				float4 worldPosition : TEXCOORD0;
			};

			vertexOutput vert(vertexInput input)
			{
				vertexOutput output;
				output.position = UnityObjectToClipPos(input.position);
				output.worldPosition = mul(unity_ObjectToWorld, input.position);
				return output;
			}

			float4 frag(vertexOutput input) : SV_TARGET
			{
				float dis = distance(input.worldPosition, _Point);
				if(dis < _DistanceNear)
				{
					return _ColorNear;
				}
				else
				{
					return _ColorFar;
				}
			}
			ENDCG
		}
	}
}
