From: Jeremy Fitzhardinge <jeremy@goop.org>
Subject: [PATCH] disable debugging in Centrino driver
Date: 22 Jun 2003 23:36:03 -0700
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <1056350162.15250.25.camel@ixodes.goop.org>
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
To: Dave Jones <davej@codemonkey.org.uk>
Cc: cpufreq list <cpufreq@www.linux.org.uk>

Hi Dave, 

Can you put this in your tree?  The debug output gets very boring very quickly.

Thanks,
	J

 arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c |    2 +-
 1 files changed, 1 insertion(+), 1 deletion(-)

diff -puN arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c~centrino-nodebug arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c
--- local-2.5/arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c~centrino-nodebug	2003-06-14 17:48:14.059224839 -0700
+++ local-2.5-jeremy/arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c	2003-06-14 17:48:14.069224754 -0700
@@ -29,7 +29,7 @@
 #define PFX		"speedstep-centrino: "
 #define MAINTAINER	"Jeremy Fitzhardinge <jeremy@goop.org>"
 
-#define CENTRINO_DEBUG
+/*#define CENTRINO_DEBUG*/
 
 #ifdef CENTRINO_DEBUG
 #define dprintk(msg...) printk(msg)

_
