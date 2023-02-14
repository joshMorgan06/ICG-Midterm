Shader "Custom/ToonShader"
{
	Properties
	{
		_Color("Color", Color) = (1,1,1,1)

		_MainTex("Albedo (RGB)", 2D) = "white" {}
		[Toggle] _ShowTexture("Show Texture?", Float) = 1
		_RampTex("Ramp Texture", 2D) = "white"{}

		_RimColor("Rim Color", Color) = (1, 1, 1, 1)
		_RimPower("Rim Power", Range(0.5, 15.0)) = 15.0
		[Toggle] _ShowRimLight("Show Rim Light?", Float) = 1
	}

	SubShader
	{
		Tags {"RenderType" = "Opaque"}
		LOD 200

		CGPROGRAM
		#pragma surface surf ToonRamp
		#pragma target 3.0

		float4 _Color;
		sampler2D _RampTex;
		sampler2D _MainTex;
		float _ShowTexture;
		float4 _RimColor;
		float _RimPower;
		float _ShowRimLight;

		float4 LightingToonRamp(SurfaceOutput s, fixed3 lightDir, fixed atten)
		{
			float diff = (dot(s.Normal, lightDir) * 0.5 + 0.5) * atten;
			float2 rh = diff;
			float3 ramp = tex2D(_RampTex, rh).rgb;

			float4 c;
			c.rgb = s.Albedo * _LightColor0.rgb * (ramp);
			c.a = s.Alpha;
			return c;
		}

		struct Input
		{
			float2 uv_MainTex;
			float3 viewDir;
			float3 worldPos;
		};

		void surf(Input IN, inout SurfaceOutput o)
		{
			fixed4 c = (tex2D(_MainTex, IN.uv_MainTex)) * _ShowTexture;
			o.Albedo = c.rgb * _Color;
			half rim = 1.0 - saturate(dot(normalize(IN.viewDir), o.Normal));
			o.Emission = (_RimColor.rgb * pow(rim, _RimPower)) * _ShowRimLight;
			o.Alpha = c.a;
		}

		ENDCG
	}
	
	FallBack "Diffuse"
}
