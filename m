From: Mattia Dongili <malattia@linux.it>
Subject: [cpufrequtils patch] really use STRIPCMD
Date: Mon, 27 Mar 2006 01:01:15 +0200
Message-ID: <20060326230115.GA4548@inferi.kami.home>
References: <20060326101231.GA19126@dominikbrodowski.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="wq9mPyueHGvFACwf"
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
Cc: Dominik Brodowski <linux@dominikbrodowski.net>


--wq9mPyueHGvFACwf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Mar 26, 2006 at 12:12:31PM +0200, Dominik Brodowski wrote:
[...]
> longer depend on the autotools but on plain Makefiles. Thanks for all the
> input I received following the release of the RFC tarball 0.5-pre1.

Hello Dominik,
unfortunately it seems we did miss something :)
The attached (trivial) patch makes the build script really use STRIPCMD,
besides defining it.

-- 
mattia
:wq!

--wq9mPyueHGvFACwf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="use_stripcmd.diff"

--- cpufrequtils-001/Makefile	2006-03-26 12:02:01.000000000 +0200
+++ cpufrequtils-001.dirty/Makefile	2006-03-27 00:46:49.185295680 +0200
@@ -192,7 +192,7 @@
 cpufreq-%: $(UTIL_OBJS)
 	$(QUIET) $(CC) $(CFLAGDEF) $(CFLAGS) -g -I. -I./lib/ -c -o utils/$@.o utils/$*.c
 	$(QUIET) $(CC) $(CFLAGDEF) $(CFLAGS) -g -I./lib/ -L. -L./.libs/ -lcpufreq -o $@ utils/$@.o
-	$(STRIP) $@
+	$(STRIPCMD) $@
 
 utils: cpufreq-info cpufreq-set
 

--wq9mPyueHGvFACwf
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@lists.linux.org.uk
http://lists.linux.org.uk/mailman/listinfo/cpufreq

--wq9mPyueHGvFACwf--

