ifeq (,$(filter-out tegra%,$(TARGET_BOARD_PLATFORM)))
include $(all-subdir-makefiles)
endif
