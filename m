From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: [PATCH] fix comment in speedstep-ich
Date: Fri, 14 May 2004 17:43:03 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040514154303.GB11757@dominikbrodowski.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: davej@codemonkey.org.uk, cpufreq@www.linux.org.uk

Fix an invalid comment in speedstep-ich -- the driver is for ICH only,
not for PIIX4. Thanks to Christian Hilberg for noting this.

 arch/i386/kernel/cpu/cpufreq/speedstep-ich.c |    2 +-
 1 files changed, 1 insertion(+), 1 deletion(-)

diff -ruN linux-original/arch/i386/kernel/cpu/cpufreq/speedstep-ich.c linux/arch/i386/kernel/cpu/cpufreq/speedstep-ich.c
--- linux-original/arch/i386/kernel/cpu/cpufreq/speedstep-ich.c	2004-05-14 13:09:48.000000000 +0200
+++ linux/arch/i386/kernel/cpu/cpufreq/speedstep-ich.c	2004-05-14 17:25:45.716390928 +0200
@@ -179,7 +179,7 @@
 /**
  * speedstep_detect_chipset - detect the Southbridge which contains SpeedStep logic
  *
- *   Detects PIIX4, ICH2-M and ICH3-M so far. The pci_dev points to 
+ *   Detects ICH2-M, ICH3-M and ICH4-M so far. The pci_dev points to 
  * the LPC bridge / PM module which contains all power-management 
  * functions. Returns the SPEEDSTEP_CHIPSET_-number for the detected
  * chipset, or zero on failure.
