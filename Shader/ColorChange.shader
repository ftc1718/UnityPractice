Shader "Unlit/ColorChange"
{
	Properties
	{
		_Color("Color", Color) = (1, 0, 0, 1)
	}
	SubShader
	{
		Pass
		{
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag

			fixed4 _Color;

			float4 vert(float4 v : POSITION) : POSITION
			{
				return UnityObjectToClipPos(v);
			}

			fixed4 frag() : COLOR
			{
				return _Color;
			}
			ENDCG
		}
	}
}
