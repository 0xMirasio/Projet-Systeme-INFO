/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

#include "xsi.h"

struct XSI_INFO xsi_info;

char *IEEE_P_2592010699;
char *STD_STANDARD;
char *SIMPRIM_P_0947159679;
char *IEEE_P_2717149903;
char *SIMPRIM_P_4208868169;
char *IEEE_P_1367372525;
char *STD_TEXTIO;


int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    ieee_p_2592010699_init();
    std_textio_init();
    ieee_p_2717149903_init();
    simprim_p_0947159679_init();
    ieee_p_1367372525_init();
    simprim_p_4208868169_init();
    simprim_a_3221717806_2431929443_4252805745_init();
    simprim_a_3221717806_2431929443_0880553409_init();
    simprim_a_3221717806_2431929443_1054998731_init();
    simprim_a_3221717806_2431929443_0596022442_init();
    simprim_a_3221717806_2431929443_0574946973_init();
    simprim_a_3221717806_2431929443_0537018564_init();
    simprim_a_3221717806_2431929443_2575060374_init();
    simprim_a_3221717806_2431929443_2620611347_init();
    simprim_a_3221717806_2431929443_2649829668_init();
    simprim_a_3221717806_2431929443_2679607165_init();
    simprim_a_3221717806_2431929443_1059089148_init();
    simprim_a_3221717806_2431929443_0433961640_init();
    simprim_a_1981857333_2082082460_init();
    simprim_a_2491142442_2082082460_init();
    simprim_a_3156740924_4150518722_0566242035_init();
    simprim_a_3156740924_4150518722_0613366902_init();
    simprim_a_3156740924_4150518722_0743943973_init();
    simprim_a_3156740924_4150518722_2604331983_init();
    simprim_a_3156740924_4150518722_0650740271_init();
    simprim_a_3156740924_4150518722_0764790034_init();
    simprim_a_3156740924_4150518722_2599983608_init();
    simprim_a_3156740924_4150518722_2562598817_init();
    simprim_a_2880286190_2413300256_1542356924_init();
    simprim_a_2880286190_2413300256_1512838539_init();
    simprim_a_2880286190_2413300256_3661249539_init();
    simprim_a_2880286190_2413300256_3690485300_init();
    simprim_a_2880286190_2413300256_2644133587_init();
    simprim_a_2880286190_2413300256_2623024356_init();
    simprim_a_2880286190_2413300256_2652803773_init();
    simprim_a_2880286190_2413300256_2682058890_init();
    simprim_a_3936907874_4055128042_1542356924_init();
    simprim_a_3936907874_4055128042_1512838539_init();
    simprim_a_3936907874_4055128042_3661249539_init();
    simprim_a_3936907874_4055128042_3690485300_init();
    simprim_a_3936907874_4055128042_2644133587_init();
    simprim_a_3936907874_4055128042_2623024356_init();
    simprim_a_3936907874_4055128042_2652803773_init();
    simprim_a_3936907874_4055128042_2682058890_init();
    simprim_a_3395610110_2220797900_1542356924_init();
    simprim_a_3395610110_2220797900_1512838539_init();
    simprim_a_3395610110_2220797900_3661249539_init();
    simprim_a_3395610110_2220797900_3690485300_init();
    simprim_a_3395610110_2220797900_2644133587_init();
    simprim_a_3395610110_2220797900_2623024356_init();
    simprim_a_3395610110_2220797900_2652803773_init();
    simprim_a_3395610110_2220797900_2682058890_init();
    simprim_a_3395610110_2220797900_0433961640_init();
    simprim_a_2118406211_3300903326_3346948913_init();
    simprim_a_4181367278_3380326129_0433961640_init();
    simprim_a_2155285624_1178295121_0433961640_init();
    work_a_0753167054_0632001823_init();
    work_a_4214564976_2372691052_init();


    xsi_register_tops("work_a_4214564976_2372691052");

    IEEE_P_2592010699 = xsi_get_engine_memory("ieee_p_2592010699");
    xsi_register_ieee_std_logic_1164(IEEE_P_2592010699);
    STD_STANDARD = xsi_get_engine_memory("std_standard");
    SIMPRIM_P_0947159679 = xsi_get_engine_memory("simprim_p_0947159679");
    IEEE_P_2717149903 = xsi_get_engine_memory("ieee_p_2717149903");
    SIMPRIM_P_4208868169 = xsi_get_engine_memory("simprim_p_4208868169");
    IEEE_P_1367372525 = xsi_get_engine_memory("ieee_p_1367372525");
    STD_TEXTIO = xsi_get_engine_memory("std_textio");

    return xsi_run_simulation(argc, argv);

}
