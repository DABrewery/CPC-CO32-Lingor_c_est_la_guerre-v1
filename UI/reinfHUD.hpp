class RscTitles
{
    class RscReinfHUD
    {    
        idd = -1;
        fadein = 0;
		fadeout = 0;
		duration = 1e+011;
        objects[] = {};
        onLoad = "uiNamespace setVariable ['ReinfHUD', _this select 0]";
	       
        class controlsBackground
        {
            
            class iconBackground 
            {
                idc = -1;
                type = 0;
                style = 2096;
                x = 0.370;
                y = safezoneY;
                w = 0.03 * safezoneW;
                h = 0.03 * safezoneH;
                colorText[] = {1, 1, 1, 1};
                colorBackground[]={0,0,0,0};
                sizeEx = 0.4;
                font = "EtelkaNarrowMediumPro";
                text = "img\reinf.jpg";
            }
            
        }

        class controls
        {
            class infoText
            {    
                idc = 100;
                type = 0;
                style = 529; 
                x = 0.39;
                y = safeZoneY;
                w = 0.10 * safezoneW;
                h = 0.03 * safezoneH;
                font = "RobotoCondensedBold";
                sizeEx = 0.025;
                colorBackground[] = {1,1,1,0.2};
                colorText[] = {0,0,0,1};
                linespacing=1;
                text = "Erreur d'initialisation\ndes valeurs de l'HUD";
            }
        }

    }  

}
