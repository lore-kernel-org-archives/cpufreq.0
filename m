From: Bruno Ducrot <ducrot@poupinou.org>
Subject: [PATCH] powernow-k7: example use for powernow_acpi_init()
Date: Mon, 22 Mar 2004 10:38:51 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040322093851.GO28592@poupinou.org>
References: <20040322092543.GN28592@poupinou.org>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040322092543.GN28592@poupinou.org>
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
To: davej@codemonkey.org.uk
Cc: cpufreq@www.linux.org.uk


This is an example for using the powernow-k7 ACPI perflib integration,
when the legacy PSB/PST tables are broken.


 arch/i386/kernel/cpu/cpufreq/powernow-k7.c |   13 +++++++++----
 1 files changed, 9 insertions(+), 4 deletions(-)

--- linux-2.6.5-rc1/arch/i386/kernel/cpu/cpufreq/powernow-k7.c	2004/03/22 09:33:09	1.2
+++ linux-2.6.5-rc1/arch/i386/kernel/cpu/cpufreq/powernow-k7.c	2004/03/22 09:39:55
@@ -413,6 +413,8 @@ err0:
 	acpi_processor_perf = NULL;
 	return retval;
 }
+#else
+static int powernow_acpi_init(void) {return -EINVAL;}
 #endif
 
 static int powernow_decode_bios (int maxfid, int startvid)
@@ -486,10 +488,13 @@ static int powernow_decode_bios (int max
 						p+=2;
 				}
 			}
-			printk (KERN_INFO PFX "No PST tables match this cpuid (0x%x)\n", etuple);
-			printk (KERN_INFO PFX "This is indicative of a broken BIOS.\n");
-			printk (KERN_INFO PFX "See http://www.codemonkey.org.uk/projects/cpufreq/powernow-k7.shtml\n");
-			return -EINVAL;
+			ret = powernow_acpi_init();
+			if (ret) {
+				printk (KERN_INFO PFX "No PST tables match this cpuid (0x%x)\n", etuple);
+				printk (KERN_INFO PFX "This is indicative of a broken BIOS.\n");
+				printk (KERN_INFO PFX "See http://www.codemonkey.org.uk/projects/cpufreq/powernow-k7.shtml\n");
+			}
+			return ret;
 		}
 		p++;
 	}

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
