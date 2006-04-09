From: Mattia Dongili <malattia@linux.it>
Subject: [cpufrequtils patch] sanitize rpath and quieten the strip command
Date: Sun, 9 Apr 2006 17:57:00 +0200
Message-ID: <20060409155700.GN6712@inferi.kami.home>
References: <20060326101231.GA19126@dominikbrodowski.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="hK8Uo4Yp55NZU70L"
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


--hK8Uo4Yp55NZU70L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Dominik,

one more patch addressing two issues (one hunk each):

1 - use ccdv to run strip (yes, a really cosmetic change)

2 - use the proper rpath when linking libcpufreq.so. It is needed
    because otherwise libtool will create a messed libdir in
    libcpufreq.la fooling 3rd parties linking against libcpufreq (and
    using libtool for themselves).
    Since the problem is the usage of $(DESTDIR) this will probably only
    show in prebuilt packages in linux distros.

Eg: building cpufrequtils in /tmp/cpufrequtils-001/ and willing to
install in /tmp/package

# cd /tmp/cpufrequtils-001/ && make DESTDIR=/tmp/package
...
# grep libdir /tmp/cpufrequtils-001/libcpufreq.la
libdir='/tmp/package/usr/lib'

I suppose this is definitely not the wanted behaviour.

Thanks
-- 
mattia
:wq!

--hK8Uo4Yp55NZU70L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="sanitize_rpath+quieten_strip.diff"

--- cpufrequtils-001.clean/Makefile	2006-04-09 17:20:39.029391478 +0200
+++ cpufrequtils-001/Makefile	2006-04-09 09:27:00.433340228 +0200
@@ -185,14 +185,14 @@ libcpufreq.la: $(LIB_OBJS) $(LIB_HEADERS
 		exit -1; \
 	fi;
 	$(QUIET) $(LIBTOOL) $(LIBTOOL_OPT) --mode=link $(CC) $(CFLAGDEF) $(CFLAGS) $(LDFLAGS) -o libcpufreq.la -rpath \
-		$(DESTDIR)${libdir} -version-info $(LIB_VERSION) $(LIB_PARTS)
+		${libdir} -version-info $(LIB_VERSION) $(LIB_PARTS)
 
 libcpufreq: libcpufreq.la
 
 cpufreq-%: $(UTIL_OBJS)
 	$(QUIET) $(CC) $(CFLAGDEF) $(CFLAGS) -g -I. -I./lib/ -c -o utils/$@.o utils/$*.c
 	$(QUIET) $(CC) $(CFLAGDEF) $(CFLAGS) -g -I./lib/ -L. -L./.libs/ -lcpufreq -o $@ utils/$@.o
-	$(STRIPCMD) $@
+	$(QUIET) $(STRIPCMD) $@
 
 utils: cpufreq-info cpufreq-set
 

--hK8Uo4Yp55NZU70L
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@lists.linux.org.uk
http://lists.linux.org.uk/mailman/listinfo/cpufreq

--hK8Uo4Yp55NZU70L--

