From: Dave Jones <davej@redhat.com>
Subject: ACPI / CPUFREQ.
Date: Tue, 3 Aug 2004 16:10:11 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040803151010.GQ12724@redhat.com>
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
To: cpufreq@www.linux.org.uk

At his ACPI talk at OLS, Len mentioned that it would be beneficial
to have ACPI and CPUFREQ working together a little better.

Len, care to kick off some thoughts on what pieces you had in mind ?

The biggest problem is probably ACPI thinking the CPU should be at a
certain P-state whilst the user has forced it to another with cpufreq.

		Dave
