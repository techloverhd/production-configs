<?xml version='1.0' encoding='utf-8' standalone='yes' ?>
<map>
    <!-- TechLoverHD Calibrated BigKaka AGC 9.6 Profile for Samsung Galaxy S25 Ultra (SM-S938B / SM-S938U) -->
    <!-- Target APK: AGC9.6.19_V7.0_samsung.apk (com.samsung.agc.gcam96) | Guide: https://techloverhd.com/2026/11/gcam-port-samsung-galaxy-s25-ultra-config-xml/ -->
    <string name="pref_config_nickname_key">S25U_ISOCELL_Pro_v7</string>
    <string name="pref_config_changelog_key">Galaxy S25 Ultra (Snapdragon 8 Elite): 5-lens Camera2 mapping (HP2 Main ID 0, 3LU Front ID 1, JN3 0.6x ID 2, IMX754 3x ID 3, IMX854 5x ID 4), balanced sharpness and chroma noise reduction, Samsung RAW16 merge fix enabled.</string>

    <!-- Camera2 API Physical Sensor ID Mapping -->
    <set name="pref_all_camera_id_list_key">
        <string>0</string>
        <string>1</string>
        <string>2</string>
        <string>3</string>
        <string>4</string>
    </set>
    <set name="pref_camera_id_list_key">
        <string>0</string>
        <string>1</string>
        <string>2</string>
        <string>3</string>
        <string>4</string>
    </set>

    <!-- Lens Display Titles -->
    <string name="pref_lens_title_key_0">Main</string>
    <string name="pref_lens_title_key_1">Wide</string>
    <string name="pref_lens_title_key_2">Tele 3x</string>
    <string name="pref_lens_title_key_3">Tele 5x</string>
    <string name="pref_lens_title_key_4">Front</string>

    <!-- Global JPEG Quality, HDR+ & Buffer Settings -->
    <string name="pref_qjpg_key">100</string>
    <string name="pref_camera_hdrplus_option_available_key">1</string>
    <string name="pref_camera_raw_output_option_available_key">1</string>
    <string name="pref_frame_count_zsl_key">15</string>
    <string name="pref_frame_count_key">15</string>
    <string name="pref_frame_count_zsl_key_0">15</string>
    <string name="pref_frame_count_zsl_key_1">15</string>
    <string name="pref_frame_count_zsl_key_2">15</string>
    <string name="pref_frame_count_zsl_key_3">15</string>
    <string name="pref_frame_count_zsl_key_4">15</string>
    <string name="lib_pref_frame_count_key">0</string>
    <string name="lib_pref_frame_count_zsl_key">0</string>
    <string name="lib_pref_frame_count_ns_key">0</string>

    <!-- Samsung One UI 9 / Snapdragon 8 Elite RAW Format & Merge Stability -->
    <string name="pref_raw_key">0</string>
    <string name="pref_raw_key_0">37</string>
    <string name="pref_raw_res_key">0</string>
    <string name="pref_raw_res_key_0">-1</string>
    <string name="pref_raw_res_key_1">-1</string>
    <string name="pref_raw_res_key_2">-1</string>
    <string name="pref_raw_res_key_3">-1</string>
    <string name="pref_raw_res_key_4">-1</string>
    <string name="pref_sensor_color_filter_key">0</string>
    <string name="pref_sensor_color_filter_key_0">0</string>
    <string name="pref_sensor_color_filter_key_1">0</string>
    <string name="pref_sensor_color_filter_key_2">0</string>
    <string name="pref_sensor_color_filter_key_3">0</string>
    <string name="pref_sensor_color_filter_key_4">0</string>
    <string name="lib_fixraw16merge_key_p0_0">1</string>
    <string name="lib_fixraw16merge_key_p1_0">1</string>
    <string name="lib_fixraw16merge_key_p2_0">1</string>
    <string name="lib_fixraw16merge_key_p3_0">1</string>
    <string name="lib_fixraw16merge_key_p4_0">1</string>

    <!-- Auto White Balance (AWB) Calibration -->
    <string name="pref_awb_key">2</string>
    <string name="pref_awb_key_0">54</string>
    <string name="pref_awb_key_1">0</string>
    <string name="pref_awb_key_2">26</string>
    <string name="pref_awb_key_3">26</string>
    <string name="pref_awb_key_4">26</string>
    <string name="pref_awb_bg_coeff_key">1.0</string>
    <string name="pref_awb_rg_coeff_key">1.0</string>
    <string name="lib_pref_awb_bg_coeff_key">1.0</string>

    <!-- Libpatcher: Natural Micro-Contrast & Chroma Noise Reduction -->
    <string name="lib_profile_title_key_p0_0">Main-Natural</string>
    <string name="lib_profile_title_key_p0_1">Wide-Natural</string>
    <string name="lib_profile_title_key_p0_2">Tele3x-Natural</string>
    <string name="lib_profile_title_key_p0_3">Tele5x-Natural</string>
    <string name="lib_profile_title_key_p0_4">Front-Natural</string>

    <string name="lib_sharpness_a_key_p0_0">0.875</string>
    <string name="lib_sharpness_a_key_p0_1">1.0</string>
    <string name="lib_sharpness_a_key_p0_2">1.0625</string>
    <string name="lib_sharpness_a_key_p0_3">1.0625</string>
    <string name="lib_sharpness_a_key_p0_4">0.875</string>

    <string name="lib_chroma_a_key_p0_0">1.0</string>
    <string name="lib_chroma_a_key_p0_1">1.0</string>
    <string name="lib_chroma_a_key_p0_2">1.125</string>
    <string name="lib_chroma_a_key_p0_3">1.200</string>
    <string name="lib_chroma_a_key_p0_4">1.0</string>
    <string name="lib_chroma_b_key_p0_0">1.0625</string>
    <string name="lib_chroma_b_key_p0_3">1.200</string>

    <string name="lib_highlight_fix_zsl_key_p0_0">1</string>
    <string name="lib_highlight_fix_zsl_key_p0_1">1</string>
    <string name="lib_highlight_fix_zsl_key_p0_2">1</string>
    <string name="lib_highlight_fix_zsl_key_p0_3">1</string>
    <string name="lib_highlight_fix_zsl_key_p0_4">1</string>
    <string name="lib_lutnoisefix_key_p0_0">4.0 (ON)</string>
    <string name="lib_lutnoisefix_key_p0_1">4.0 (ON)</string>
    <string name="lib_lutnoisefix_key_p0_2">4.0 (ON)</string>
    <string name="lib_lutnoisefix_key_p0_3">4.0 (ON)</string>
    <string name="lib_gpu_unsharp_intensity_key">0</string>
</map>
