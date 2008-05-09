From: =?ISO-8859-1?Q?Alex_Villac=ED=ADs_Lasso?=
	<avillaci@ceibo.fiec.espol.edu.ec>
Subject: About p4-clockmod breakage/removal
Date: Fri, 09 May 2008 10:22:38 -0500
Message-ID: <48246C3E.7010608@ceibo.fiec.espol.edu.ec>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org+glkc-cpufreq=gmane.org@lists.linux.org.uk
To: cpufreq@lists.linux.org.uk

In a somewhat old computer I use at home, I have a Pentium 4 CPU running 
at 1.7GHz. On this computer, acpi-cpufreq does not work (modprobe fails 
with -ENODEV), only p4-clockmod. Lately this means I have to compile my 
own kernel to get speed throttling on my computer.

Recently, patch ed9cbcd40004904dbe61ccc16d6106a7de38c998 (Revert 
"speedstep-lib.c: fix frequency multiplier for Pentium4 models 0&1") 
broke clock speed reporting. It now reports I have a max speed of 13.80 
GHz instead of 1.7GHz. I only wish my CPU were that fast... Reverting 
this patch fixes the problem for me. However, since I suscribed 
yesterday to this list, I see talk about removing p4-clockmod altogether 
from the tree. Maybe my real problem is that acpi-cpufreq does not work 
even though it should, but I have yet to find a way to make the module 
print the information that is supposed to be displayed through dprintk() 
messages. What else can I do to debug acpi-cpufreq on my machine?

-- 
perl -e '$x=2.4;print sprintf("%.0f + %.0f = %.0f\n",$x,$x,$x+$x);'
