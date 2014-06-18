MODULE_SRCDIR=module
MODULE_CPP_SRCS=\
	$(MODULE_SRCDIR)/gmp-openh264.cpp\

MODULE_OBJS += $(MODULE_CPP_SRCS:.cpp=.$(OBJ))

OBJS += $(MODULE_OBJS)
$(MODULE_SRCDIR)/%.$(OBJ): $(MODULE_SRCDIR)/%.cpp
	$(QUIET_CXX)$(CXX) $(CFLAGS) $(CXXFLAGS) $(INCLUDES) $(MODULE_CFLAGS) $(MODULE_INCLUDES) -c $(CXX_O) $<

$(LIBPREFIX)module.$(LIBSUFFIX): $(MODULE_OBJS)
	$(QUIET)rm -f $@
	$(QUIET_AR)$(AR) $(AR_OPTS) $+

plugin: $(LIBPREFIX)module.$(LIBSUFFIX)
LIBRARIES += $(LIBPREFIX)module.$(LIBSUFFIX)
