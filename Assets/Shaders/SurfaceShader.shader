Shader "z/Test" 
{
    Properties
    {
        _Main1Tex ("Main1 Texture", 2D) = "white" {}
        _Main2Tex ("Main2 Texture", 2D) = "white" {}
        _Main3Tex ("Main3 Texture", 2D) = "white" {}
        _MaskTex ("Mask Texture", 2D) = "black" {}
    }
    
    SubShader
    {
        CGPROGRAM

        #pragma surface surf Lambert

        sampler2D
            _Main1Tex,
            _Main2Tex,
            _Main3Tex,
            _MaskTex;
        
        struct Input
        {
            half2 uv_Main1Tex;
            half2 uv_MaskTex;
        };
        
        void surf(Input IN, inout SurfaceOutput o)
        {
            fixed3 masks = tex2D(_MaskTex, IN.uv_MaskTex);
            fixed3 color =
                tex2D(_Main1Tex, IN.uv_Main1Tex) * masks.r +
                tex2D(_Main2Tex, IN.uv_Main1Tex) * masks.g +
                tex2D(_Main3Tex, IN.uv_Main1Tex) * masks.b;
            o.Albedo = color;
        }
        
        ENDCG
    }
    
    FallBack "Diffuse"
}