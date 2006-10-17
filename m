From: Dave Jones <davej@redhat.com>
Subject: speedstep-smi detection broken.
Date: Tue, 17 Oct 2006 01:55:29 -0400
Message-ID: <20061017055529.GJ32681@redhat.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
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
To: miura@da-cha.org
Cc: cpufreq@lists.linux.org.uk

If someone inserts speedstep-smi on a mobile P4,
it prevents other cpufreq modules from loading until it
is unloaded.

Opinions on this patch ?
(I'm tempted to just remove the printk too).

	Dave

--- local-git/arch/i386/kernel/cpu/cpufreq/speedstep-smi.c~	2006-10-17 01:53:29.000000000 -0400
+++ local-git/arch/i386/kernel/cpu/cpufreq/speedstep-smi.c	2006-10-17 01:54:02.000000000 -0400
@@ -362,7 +362,7 @@ static int __init speedstep_init(void)
 		break;
 	case SPEEDSTEP_PROCESSOR_P4M:
 		printk(KERN_INFO "speedstep-smi: you're trying to use this cpufreq driver on a Pentium 4-based CPU. Most likely it will not work.\n");
-		break;
+		return -ENODEV;
 	default:
 		speedstep_processor = 0;
 	}


-- 
http://www.codemonkey.org.uk
