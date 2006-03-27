From: Mattia Dongili <malattia@linux.it>
Subject: Re: [ANNOUNCE] cpufrequtils-001 released
Date: Mon, 27 Mar 2006 21:47:26 +0200
Message-ID: <20060327194726.GB4150@inferi.kami.home>
References: <20060326101231.GA19126@dominikbrodowski.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="8t9RHnE3ZwKMSgU+"
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20060326101231.GA19126@dominikbrodowski.de>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
To: cpufreq@lists.linux.org.uk


--8t9RHnE3ZwKMSgU+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Dominik,

I have on more patch to discuss :) (sorry, I know you're very busy, and
please forgive me if I didn't respect your m-f-t previously).

The current Makefile doesn't allow an user to define his own CFLAGS
without breaking the build completely. The attached patch addresses it
(it could be done differently by defining a new variable and leaving
CFLAGS and CFLAGDEF untouched, let me know if you prefer this approach).

Thanks
-- 
mattia
:wq!

--8t9RHnE3ZwKMSgU+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="leave_cflags_alone.diff"

--- cpufrequtils-001.clean/Makefile	2006-03-27 20:53:30.082677607 +0200
+++ cpufrequtils-001/Makefile	2006-03-27 20:24:52.935362607 +0200
@@ -125,16 +125,16 @@
 LIB_OBJS = 	lib/cpufreq.c lib/proc.c lib/sysfs.c
 LIB_PARTS = 	lib/cpufreq.lo
 
-CFLAGS :=	-pipe
+CFLAGDEF +=	-pipe
 
 ifeq ($(strip $(PROC)),true)
 	LIB_PARTS += lib/proc.lo
-	CFLAGS += -DINTERFACE_PROC
+	CFLAGDEF += -DINTERFACE_PROC
 endif
 
 ifeq ($(strip $(SYSFS)),true)
 	LIB_PARTS += lib/sysfs.lo
-	CFLAGS += -DINTERFACE_SYSFS
+	CFLAGDEF += -DINTERFACE_SYSFS
 	LDFLAGS = -lsysfs
 endif
 
@@ -158,10 +158,10 @@
 
 # if DEBUG is enabled, then we do not strip or optimize
 ifeq ($(strip $(DEBUG)),true)
-	CFLAGS  += -O1 -g -DDEBUG
+	CFLAGDEF  += -O1 -g -DDEBUG
 	STRIPCMD = /bin/true -Since_we_are_debugging
 else
-	CFLAGS  += $(OPTIMIZATION) -fomit-frame-pointer
+	CFLAGDEF  += $(OPTIMIZATION) -fomit-frame-pointer
 	STRIPCMD = $(STRIP) -s --remove-section=.note --remove-section=.comment
 endif
 
@@ -177,7 +177,7 @@
 	@$(HOSTCC) -O1 build/ccdv.c -o build/ccdv
 
 %.lo: $(LIB_OBJS) $(LIB_HEADERS)
-	$(QUIET) $(LIBTOOL) $(LIBTOOL_OPT) --mode=compile $(CC) $(CFLAGS) -o $@ -c $*.c
+	$(QUIET) $(LIBTOOL) $(LIBTOOL_OPT) --mode=compile $(CC) $(CFLAGDEF) $(CFLAGS) -o $@ -c $*.c
 
 libcpufreq.la: $(LIB_OBJS) $(LIB_HEADERS) $(LIB_PARTS) Makefile
 	@if [ $(strip $(SYSFS)) != true -a $(strip $(PROC)) != true ]; then \

--8t9RHnE3ZwKMSgU+
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@lists.linux.org.uk
http://lists.linux.org.uk/mailman/listinfo/cpufreq

--8t9RHnE3ZwKMSgU+--

