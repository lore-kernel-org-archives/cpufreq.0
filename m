From: Erich Boleyn <erich@uruk.org>
Subject: Re: powersaved is backwards on my machine...
Date: Tue, 03 Oct 2006 09:59:23 -0700
Message-ID: <E1GUnc3-0002yf-Dg@uruk.org>
References: <E1GHkFA-000420-0x@uruk.org>
	<20061002231848.GD9748@dominikbrodowski.de>
	<20061003140958.GA7087@homac>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="----- =_aaaaaaaaaa0"
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-reply-to: <20061003140958.GA7087@homac> 
Content-ID: <11444.1159894728.0@uruk>
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
To: Holger Macht <hmacht@suse.de>, cpufreq@lists.linux.org.uk

------- =_aaaaaaaaaa0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <11444.1159894728.1@uruk>

Holger Macht <hmacht@suse.de> wrote:

> On Mon 02. Oct - 19:18:48, Dominik Brodowski wrote:
> > Hi,
> > 
> > On Mon, Aug 28, 2006 at 09:45:48AM -0700, Erich Boleyn wrote:
> > > So, I could not find any documentation on cpufreq that claimed the
> > > frequency states listed should be in any particular order, but maybe
> > > I was just not looking in the right place for the documentation...
> > 
> > There's no such documentation that I'm aware of :) and I don't see why we
> > should enforce any particular order here. So I'd say fixing powernowd is the
> > right approach here.
> 
> Ok, so I will fix powersaved to sort the values after reading them from
> scaling_avaialable_frequencies because I can't even assume that they are
> in any particular order, neither descending nor ascending.

I had come to that conclusion as well, and made a tiny patch which did a
"qsort" on the values involved as a quick and dirty solution.


------- =_aaaaaaaaaa0
Content-Type: text/plain; name="/home/erich/powersave-0.13.5-sort.patch";
	charset="us-ascii"
Content-ID: <11444.1159894728.2@uruk>

diff -ruN powersave-0.13.5.orig/daemon/cpufreq_userspace.cpp powersave-0.13.5/daemon/cpufreq_userspace.cpp
--- powersave-0.13.5.orig/daemon/cpufreq_userspace.cpp	2006-08-14 03:57:16.000000000 -0700
+++ powersave-0.13.5/daemon/cpufreq_userspace.cpp	2006-08-29 21:54:02.000000000 -0700
@@ -24,6 +24,7 @@
 
 #include <sstream>
 #include <cpufreq.h>
+#include <stdlib.h>
 
 #include "cpufreq_interface.h"
 #include "globals.h"
@@ -328,6 +329,10 @@
 }
 #endif
 
+static int myqsortcmp(const void *a, const void *b)
+{
+	return (*(unsigned*)b) - (*(unsigned*)a);
+}
 
 int CPUFreq_Userspace::initFreqsViaFile()
 {
@@ -351,6 +356,9 @@
 		}
 	}
 
+	// Sort frequencies
+	qsort(&_speeds_kHz[0], speed_no, sizeof(unsigned), myqsortcmp);
+
 	_speeds_kHz[speed_no + 1] = 0;
 	_last_step = speed_no;
 

------- =_aaaaaaaaaa0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <11444.1159894728.3@uruk>

--
    Erich Stefan Boleyn     <erich@uruk.org>     http://www.uruk.org/
"Reality is truly stranger than fiction; Probably why fiction is so popular"

------- =_aaaaaaaaaa0
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@lists.linux.org.uk
http://lists.linux.org.uk/mailman/listinfo/cpufreq

------- =_aaaaaaaaaa0--

