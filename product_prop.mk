# Adb
ifeq ($(TARGET_BUILD_VARIANT),eng)
# /vendor/default.prop is force-setting ro.adb.secure=1
# Get rid of that by overriding it on eng builds
PRODUCT_PRODUCT_PROPERTIES += \
    ro.secure=0 \
    ro.adb.secure=0
endif

# Assertive display
PRODUCT_PRODUCT_PROPERTIES += \
    ro.vendor.display.ad=1 \
    ro.vendor.display.sensortype=2 \
    ro.vendor.display.ad.sdr_calib_data=/vendor/etc/OPPO_OLED_AD_calib.cfg

# Audio
PRODUCT_PRODUCT_PROPERTIES += \
   ro.config.vc_call_vol_steps=7 \
   ro.config.media_vol_steps=25 \
   ro.qc.sdk.audio.fluencetype=none \
   persist.audio.fluence.voicecall=true \
   persist.audio.fluence.voicerec=false \
   persist.audio.fluence.speaker=true
   vendor.audio.hal.boot.timeout.ms=20000 \
   ro.af.client_heap_size_kbyte=7168 \
   vendor.audio_hal.in_period_size=144 \
   vendor.audio_hal.period_multiplier=3 \
   vendor.audio.adm.buffering.ms=6 \
   persist.vendor.audio.fluence.voicecomm=true \
   vendor.audio.feature.a2dp_offload.enable=true \
   vendor.audio.feature.afe_proxy.enable=true \
   vendor.audio.feature.anc_headset.enable=true \
   vendor.audio.feature.battery_listener.enable=false \
   vendor.audio.feature.compr_cap.enable=false \
   vendor.audio.feature.compress_in.enable=false \
   vendor.audio.feature.compress_meta_data.enable=true \
   vendor.audio.feature.compr_voip.enable=true \
   vendor.audio.feature.concurrent_capture.enable=false \
   vendor.audio.feature.custom_stereo.enable=true \
   vendor.audio.feature.display_port.enable=true \
   vendor.audio.feature.dsm_feedback.enable=false \
   vendor.audio.feature.dynamic_ecns.enable=false \
   vendor.audio.feature.ext_hw_plugin.enable=false \
   vendor.audio.feature.external_dsp.enable=false \
   vendor.audio.feature.external_speaker.enable=false \
   vendor.audio.feature.external_speaker_tfa.enable=false \
   vendor.audio.feature.fluence.enable=true \
   vendor.audio.feature.fm.enable=true \
   vendor.audio.feature.hdmi_edid.enable=true \
   vendor.audio.feature.hdmi_passthrough.enable=true \
   vendor.audio.feature.hfp.enable=true \
   vendor.audio.feature.hifi_audio.enable=false \
   vendor.audio.feature.hwdep_cal.enable=false \
   vendor.audio.feature.incall_music.enable=true \
   vendor.audio.feature.multi_voice_session.enable=true \
   vendor.audio.feature.keep_alive.enable=false \
   vendor.audio.feature.kpi_optimize.enable=true \
   vendor.audio.feature.maxx_audio.enable=false \
   vendor.audio.feature.ras.enable=true \
   vendor.audio.feature.record_play_concurency.enable=false \
   vendor.audio.feature.src_trkn.enable=true \
   vendor.audio.feature.spkr_prot.enable=false \
   vendor.audio.feature.ssrec.enable=true \
   vendor.audio.feature.usb_offload.enable=true \
   vendor.audio.feature.usb_offload_burst_mode.enable=false \
   vendor.audio.feature.usb_offload_sidetone_volume.enable=false \
   vendor.audio.feature.deepbuffer_as_primary.enable=false \
   vendor.audio.feature.vbat.enable=true \
   vendor.audio.feature.wsa.enable=false \
   vendor.audio.feature.audiozoom.enable=false \
   vendor.audio.feature.snd_mon.enable=true

# Blur
PRODUCT_PRODUCT_PROPERTIES += \
    ro.surface_flinger.supports_background_blur=0 \
    persist.sys.sf.disable_blurs=1 \
    ro.sf.blurs_are_expensive=1

# Charger
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.charger.enable_suspend=true

# Dex
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    pm.dexopt.boot=verify \
    pm.dexopt.first-boot=verify \
    pm.dexopt.install=speed-profile \
    dalvik.vm.image-dex2oat-filter=speed \
    dalvik.vm.image-dex2oat-threads=8 \
    dalvik.vm.dex2oat-filter=speed \
    dalvik.vm.dex2oat-threads=8 \
    dalvik.vm.dex2oat64.enabled=true

# Graphics
PRODUCT_PRODUCT_PROPERTIES += \
    debug.sf.hw=1 \
    debug.sf.enable_gl_backpressure=1 \
    debug.sf.latch_unsignaled=1 \
    debug.sf.enable_hwc_vds=1 \
    debug.gralloc.enable_fb_ubwc=1 \
    debug.sf.enable_gl_backpressure=1 \
    dev.pm.dyn_samplingrate=1 \
    persist.demo.hdmirotationlock=false \
    sdm.debug.disable_skip_validate=1 \
    vendor.display.enable_default_color_mode=1 \
    vendor.gralloc.enable_fb_ubwc=1 \
    vendor.display.disable_skip_validate=1

# HAL1 apps list
PRODUCT_PRODUCT_PROPERTIES += \
    vendor.camera.hal1.packagelist=com.intsig.camscanner,com.instagram.android,net.one97.paytm

# IMS Debug
PRODUCT_PROPERTY_OVERRIDES += \
   persist.dbg.volte_avail_ovr=1 \
   persist.dbg.vt_avail_ovr=1 \
   persist.dbg.wfc_avail_ovr=1

# Media
PRODUCT_PRODUCT_PROPERTIES += \
    media.settings.xml=/vendor/etc/media_profiles_V1_0.xml

# Netflix
PRODUCT_PRODUCT_PROPERTIES += \
    ro.netflix.bsp_rev=Q660-13149-1
	
# Memory optimizations
PRODUCT_PRODUCT_PROPERTIES += \
    ro.vendor.qti.sys.fw.bservice_enable=true

# Perf
PRODUCT_PRODUCT_PROPERTIES += \
    vendor.iop.enable_prefetch_ofr=0 \
    vendor.iop.enable_uxe=0

# Radio
PRODUCT_PRODUCT_PROPERTIES += \
    DEVICE_PROVISIONED=1 \
    ro.telephony.default_network=22,22 \
    persist.vendor.radio.lte_vrte_ltd=1 \
    persist.vendor.radio.cs_srv_type=1 \
    persist.vendor.radio.rat_on=combine \
    persist.vendor.radio.force_on_dc=true \
    persist.vendor.radio.redir_party_num=1 \
    ril.subscription.types=NV,RUIM \
    telephony.lteOnCdmaDevice=1

# UI
PRODUCT_PRODUCT_PROPERTIES += \
    sys.use_fifo_ui=1

# Vulkan
PRODUCT_PRODUCT_PROPERTIES += \
    debug.hwui.renderer=skiavk

# Zygote Preforking
PRODUCT_PRODUCT_PROPERTIES += \
    persist.device.config.runtime_native.uasp_pool_enabled=true
