From: paul.devriendt@amd.com
Subject: RE: ACPI / cpufreq on Presario R3120
Date: Fri, 4 Jun 2004 13:01:40 -0500
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <99F2150714F93F448942F9A9F112634C1431B9CA@txexmtae.amd.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: linux@dominikbrodowski.de, ducrot@poupinou.org
Cc: davej@redhat.com, Cpufreq@www.linux.org.uk

This patch looks good, thanks Dominik. So, ignoring the AMD specific
case where there can only be 1 low freq entry, what happens in the
generic case where BIOS provides 2 (or more) identical pstates ?
Does the helper code just accept this happily, or should I also
add a check in powernow-k8 for this ? Paul.
