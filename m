From: Drew Varner <drew.varner@us.army.mil>
Subject: Invoking cpufreq from a C program
Date: Fri, 30 Jan 2004 13:21:57 -0500
Sender: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Message-ID: <000001c3e75d$f2817110$0200a8c0@LETHALXP>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
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
To: cpufreq@www.linux.org.uk

Hey Folks,

I want to invoke cpufreq (change processor performance states) from C code.
Should I use the /proc interface or import the cpufreq libraries?

My first guess is that the /proc interface is the best idea, to protect me
from changes in the libraries. Also, I assume that the overhead of going
through /proc is minimal compared to the latency the processor needs to
change freqs. I think there's probably some voodoo involved in invoking
kernel code from userspace, but I have never done it.

I'd appreciate any guidance on the "best" way to go about this.

Thanks,
Drew
