From: skynet <marcogrego@libero.it>
Subject: patch for dothan doesn't do anything
Date: Sat, 21 Jan 2006 12:47:57 +0000 (UTC)
Message-ID: <loom.20060121T133825-763@post.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
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
To: cpufreq@lists.linux.org.uk

I've patched module speedstep-centrino on my pentium M 715 with 2.6.14 kernel,
but I got the same: only 600MHz and 1500MHz are available. I've compiled
built-in [*]Intel Enhanced Speedstep with relative [*]Use ACPI tables to decode
valid frequency / voltage pairs. But it doesn't change anything(without this one
the cpufreq doesn't run).The new values seemed to be ignored, to  verify this
issue I've strongly undervolted the cpu values corrisponding to my CPU in
speedstep-centrino.c, and I've obtained no freezing,with all cpu's load. Please
post me your .config or any suggestions to solve this problem...
