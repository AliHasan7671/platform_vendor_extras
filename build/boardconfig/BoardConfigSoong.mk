# Add variables that we wish to make available to soong here.
EXPORT_TO_SOONG := \
    KERNEL_ARCH \
    KERNEL_BUILD_OUT_PREFIX \
    KERNEL_CROSS_COMPILE \
    KERNEL_MAKE_FLAGS \
    TARGET_KERNEL_CONFIG \
    TARGET_KERNEL_SOURCE

SOONG_CONFIG_NAMESPACES += aosapVarsPlugin

SOONG_CONFIG_aosapVarsPlugin :=

define addVar
  SOONG_CONFIG_aosapVarsPlugin += $(1)
  SOONG_CONFIG_aosapVarsPlugin_$(1) := $$(subst ",\",$$($1))
endef

$(foreach v,$(EXPORT_TO_SOONG),$(eval $(call addVar,$(v))))
