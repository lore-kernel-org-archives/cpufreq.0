From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: bad ACPI tables for Dothan?
Date: Wed, 28 Jul 2004 19:30:53 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040728173053.GA9180@dominikbrodowski.de>
References: <410557B4.6060303@gmx.de> <1090872497.8114.3.camel@localhost>
	<41061454.90306@gmx.de> <1090965071.16558.2.camel@localhost>
	<4106E08D.3000909@gmx.de> <1090970168.16558.7.camel@localhost>
	<4106EB87.4010603@gmx.de> <1090973581.16558.13.camel@localhost>
	<4107A955.5060101@gmx.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <4107A955.5060101@gmx.de>
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
To: Frederik Reiss <frederikreiss@gmx.de>
Cc: Jeremy Fitzhardinge <jeremy@goop.org>, cpufreq@www.linux.org.uk

Could you try this patch, please?

Thanks,
	Dominik

diff -ruN linux-original/arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c linux/arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c
--- linux-original/arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c	2004-07-28 19:02:28.271709968 +0200
+++ linux/arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c	2004-07-28 19:29:18.406932208 +0200
@@ -347,6 +347,12 @@
 			goto err_unreg;
 		}
 
+		if (!p.states[i].core_frequency > p.states[0].core_frequency) {
+			printk(KERN_DEBUG "P%u has larger frequency than P0, skipping\n");
+			p.states[i].core_frequency = 0;
+			continue;
+		}
+
 		if (extract_clock(p.states[i].control) != 
 		    (p.states[i].core_frequency * 1000)) {
 			printk(KERN_DEBUG "Invalid encoded frequency\n");
@@ -378,6 +384,8 @@
 		centrino_model->op_points[i].frequency = p.states[i].core_frequency * 1000;
 		if (cur_freq == centrino_model->op_points[i].frequency)
 			p.state = i;
+		if (!p.states[i].core_frequency)
+			centrino_model->op_points[i].frequency = CPUFREQ_ENTRY_INVALID;
 	}
 	centrino_model->op_points[p.state_count].frequency = CPUFREQ_TABLE_END;
