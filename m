From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: [RFC] cpufrequtils-0.5-rc1
Date: Thu, 19 Jan 2006 15:00:41 +0100
Message-ID: <20060119140041.GF2154@poupinou.org>
References: <20060117203643.GB16217@isilmar.linta.de>
	<20060118203528.GA3628@inferi.kami.home>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20060118203528.GA3628@inferi.kami.home>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@lists.linux.org.uk

On Wed, Jan 18, 2006 at 09:35:28PM +0100, Mattia Dongili wrote:
> On Tue, Jan 17, 2006 at 09:36:43PM +0100, Dominik Brodowski wrote:
> > Hi,
> > 
> > At
> > http://kernel.org/pub/linux/kernel/people/brodo/cpufrequtils-0.5-pre1.tar.bz2
> > you can find a new prerelease version of cpufrequtils. Most important is
> > that the package size was reduzed by a factor of 11, only caused by a switch
> > away from autotools to a customized Makefile based on the one to be found in
> > udev. Also, compilation speed is down by a factor of 10 or so... I'm
> > interested in your feedback on this, especially from package maintainers
> > whether this complicates their life much, or if they have any (different)
> > suggestions.
> 
> It seems Debian doesn't distribute the /usr/bin/gmsgfmt link in gettext
> packages. Changing the Makefile to use /usr/bin/msgfmt doesn't give any
> problem here.
> Is there any problem in such a change?

Same problem under Slackware.  For now, I have added a MSGFMT set to
Dominik's /usr/bin/gmgfmt per default.

Also I'm wondering if that will help if
there is a 'prefix'.  I don't like DESTDIR being set to /usr.  I much
prefer:

DESTDIR ?=
prefix ?= /usr

With Mattia's patch this will give something like that:

--- Makefile	2006/01/19 13:25:47	1.1
+++ Makefile	2006/01/19 13:41:10
@@ -24,24 +24,24 @@
 
 # Set the following to `true' to make a unstripped, unoptimized
 # binary. Leave this set to `false' for production use.
-DEBUG =		false
+DEBUG ?=	false
 
 # make the build silent. Set this to something else to make it noisy again.
-V =		false
+V ?=		false
 
 # Internationalization support (output in different languages).
 # Requires gettext.
-NLS =		true
+NLS ?=		true
 
 # Use the sysfs-based interface which is included in all 2.6 kernels
 # built with cpufreq support
-SYSFS =		true
+SYSFS ?=	true
 
 # Use the proc-based interface which is used in the 2.4 patch for cpufreq
-PROC =		true
+PROC ?=		true
 
 # Prefix to the directories we're installing to
-DESTDIR =	/usr
+DESTDIR ?=
 
 # --- CONFIGURATION END ---
 
@@ -56,16 +56,18 @@ PACKAGE =			cpufrequtils
 PACKAGE_BUGREPORT =		linux@brodo.de
 LANGUAGES = 			de fr it
 
+# Prefix to the directories where we'll install this tool.
+prefix ?=	/usr
 
 # Directory definitions. These are default and most probably
-# do not need to be changed. Please note that DESTDIR is
+# do not need to be changed. Please note that prefix is
 # added in front of any of them
 
-bindir =	/bin
-mandir =	/man
-includedir =	/include
-libdir =	/lib
-localedir =	/share/locale
+bindir ?=	/bin
+mandir ?=	/man
+includedir ?=	/include
+libdir ?=	/lib
+localedir ?=	/share/locale
 
 # Toolchain: what tools do we use, and what options do they need:
 
@@ -86,6 +88,7 @@ STRIP = $(CROSS)strip
 RANLIB = $(CROSS)ranlib
 HOSTCC = gcc
 
+MSGFMT ?= /usr/bin/gmsgfmt
 
 # Now we set up the build system
 #
@@ -185,7 +188,7 @@ libcpufreq.la: $(LIB_OBJS) $(LIB_HEADERS
 		exit -1; \
 	fi;
 	$(QUIET) $(LIBTOOL) $(LIBTOOL_OPT) --mode=link $(CC) $(CFLAGDEF) $(CFLAGS) $(LDFLAGS) -o libcpufreq.la -rpath \
-		$(DESTDIR)${libdir} -version-info $(LIB_VERSION) $(LIB_PARTS)
+		$(DESTDIR)${prefix}${libdir} -version-info $(LIB_VERSION) $(LIB_PARTS)
 
 libcpufreq: libcpufreq.la
 
@@ -212,7 +215,7 @@ update-gmo: po/$(PACKAGE).pot
 			echo "msgmerge for $$HLANG failed!"; \
 			rm -f po/$$HLANG.new.po; \
 		fi; \
-		/usr/bin/gmsgfmt --statistics -o po/$$HLANG.gmo po/$$HLANG.po; \
+		$(MSGFMT) --statistics -o po/$$HLANG.gmo po/$$HLANG.po; \
 	done;
 
 clean:
@@ -226,38 +229,38 @@ clean:
 
 
 install-lib:
-	$(INSTALL) -d $(DESTDIR)${libdir}
-	$(LIBTOOL) --mode=install $(INSTALL) libcpufreq.la $(DESTDIR)${libdir}/libcpufreq.la
-	$(INSTALL) -d $(DESTDIR)${includedir}
-	$(INSTALL_DATA) lib/cpufreq.h $(DESTDIR)${includedir}/cpufreq.h
+	$(INSTALL) -d $(DESTDIR)${prefix}${libdir}
+	$(LIBTOOL) --mode=install $(INSTALL) libcpufreq.la $(DESTDIR)${prefix}${libdir}/libcpufreq.la
+	$(INSTALL) -d $(DESTDIR)${prefix}${includedir}
+	$(INSTALL_DATA) lib/cpufreq.h $(DESTDIR)${prefix}${includedir}/cpufreq.h
 
 install-tools:
 	$(INSTALL) -d $(DESTDIR)${bindir}
-	$(INSTALL_PROGRAM) cpufreq-set $(DESTDIR)${bindir}/cpufreq-set
-	$(INSTALL_PROGRAM) cpufreq-info $(DESTDIR)${bindir}/cpufreq-info
+	$(INSTALL_PROGRAM) cpufreq-set $(DESTDIR)${prefix}${bindir}/cpufreq-set
+	$(INSTALL_PROGRAM) cpufreq-info $(DESTDIR)${prefix}${bindir}/cpufreq-info
 
 install-man:
-	$(INSTALL_DATA) -D man/cpufreq-set.1 $(DESTDIR)${mandir}/man1/cpufreq-set.1
-	$(INSTALL_DATA) -D man/cpufreq-info.1 $(DESTDIR)${mandir}/man1/cpufreq-info.1
+	$(INSTALL_DATA) -D man/cpufreq-set.1 $(DESTDIR)${prefix}${mandir}/man1/cpufreq-set.1
+	$(INSTALL_DATA) -D man/cpufreq-info.1 $(DESTDIR)${prefix}${mandir}/man1/cpufreq-info.1
 
 install-gmo:
-	$(INSTALL) -d $(DESTDIR)${localedir}
+	$(INSTALL) -d $(DESTDIR)${prefix}${localedir}
 	for HLANG in $(LANGUAGES); do \
-		echo '$(INSTALL_DATA) -D po/$$HLANG.gmo $(DESTDIR)${localedir}/$$HLANG/LC_MESSAGES/cpufrequtils.mo;' \
-		$(INSTALL_DATA) -D po/$$HLANG.gmo $(DESTDIR)${localedir}/$$HLANG/LC_MESSAGES/cpufrequtils.mo; \
+		echo '$(INSTALL_DATA) -D po/$$HLANG.gmo $(DESTDIR)${prefix}${localedir}/$$HLANG/LC_MESSAGES/cpufrequtils.mo;' \
+		$(INSTALL_DATA) -D po/$$HLANG.gmo $(DESTDIR)${prefix}${localedir}/$$HLANG/LC_MESSAGES/cpufrequtils.mo; \
 	done;
 
 install: install-lib install-tools install-man $(INSTALL_NLS)
 
 uninstall:
-	- rm -f $(DESTDIR)${libdir}/libcpufreq.*
-	- rm -f $(DESTDIR)${includedir}/cpufreq.h
-	- rm -f $(DESTDIR)${bindir}/cpufreq-set
-	- rm -f $(DESTDIR)${bindir}/cpufreq-info
-	- rm -f $(DESTDIR)${mandir}/man1/cpufreq-set.1
-	- rm -f $(DESTDIR)${mandir}/man1/cpufreq-info.1
+	- rm -f $(DESTDIR)${prefix}${libdir}/libcpufreq.*
+	- rm -f $(DESTDIR)${prefix}${includedir}/cpufreq.h
+	- rm -f $(DESTDIR)${prefix}${bindir}/cpufreq-set
+	- rm -f $(DESTDIR)${prefix}${bindir}/cpufreq-info
+	- rm -f $(DESTDIR)${prefix}${mandir}/man1/cpufreq-set.1
+	- rm -f $(DESTDIR)${prefix}${mandir}/man1/cpufreq-info.1
 	- for HLANG in $(LANGUAGES); do \
-		rm -f $(DESTDIR)${localedir}/$$HLANG/LC_MESSAGES/cpufrequtils.mo; \
+		rm -f $(DESTDIR)${prefix}${localedir}/$$HLANG/LC_MESSAGES/cpufrequtils.mo; \
 	  done;
 
 .PHONY: all utils libcpufreq update-po update-gmo install-lib install-tools install-man install-gmo install uninstall \

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
