From: Jeremy Fitzhardinge <jeremy@goop.org>
Subject: [PATCH] (resend) support for 900MHz Pentium M for
	speedstep-centrino.c
Date: 20 Jul 2003 12:16:45 -0700
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <1058728605.5980.41.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-admin@www.linux.org.uk>
Errors-To: cpufreq-admin@www.linux.org.uk
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Id: <cpufreq.vger.kernel.org>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq/>
Content-Type: text/plain; charset="us-ascii"
To: linux-kernel <linux-kernel@vger.kernel.org>, cpufreq list <cpufreq@www.linux.org.uk>

The 900MHz Pentium M has two spaces before the frequency:
"Intel(R) Pentium(R) M processor  900MHz"

This patch adds a 2nd CPU macro (_CPU) which also takes the
stringified speed so that extra spacing can be added.

	J

 i386/kernel/cpu/cpufreq/speedstep-centrino.c |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)

diff -puN
arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c~centrino-900MHz
arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c
---
local-2.5/arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c~centrino-900MHz	2003-07-12 16:38:45.000000000 -0700
+++
local-2.5-jeremy/arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c	2003-07-13 00:37:31.000000000 -0700
@@ -156,14 +156,15 @@ static struct cpufreq_frequency_table op
 };
 #undef OP
 
-#define CPU(max)	\
-	{ "Intel(R) Pentium(R) M processor " #max "MHz", (max)*1000, op_##max
}
+#define _CPU(max, name)	\
+	{ "Intel(R) Pentium(R) M processor " name "MHz", (max)*1000, op_##max
}
+#define CPU(max)	_CPU(max, #max)
 
 /* CPU models, their operating frequency range, and freq/voltage
    operating points */
 static const struct cpu_model models[] = 
 {
-	CPU( 900),
+       _CPU( 900, " 900"),
 	CPU(1100),
 	CPU(1200),
 	CPU(1300),

_
