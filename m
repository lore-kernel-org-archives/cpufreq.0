From: paul.devriendt@amd.com
Subject: RE: ACPI / cpufreq on Presario R3120
Date: Thu, 3 Jun 2004 16:42:22 -0500
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <99F2150714F93F448942F9A9F112634C1431B6EA@txexmtae.amd.com>
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
To: davej@redhat.com, ducrot@poupinou.org
Cc: Cpufreq@www.linux.org.uk


> We could kludge around this by doing a compare of the tables before we
> abort, and if they are the same, just ignore one of them.
> If it differs, we do what we do now.
> 
> Ideally, this should be fixed in a BIOS update though, or 
> alternatively
> an ACPI fallback.
> 
> Paul ?
> 
> 	Dave

I'm willing to put it in the driver. It is easy to ignore certain
table entries (thanks Dominik!), and I already have to do so for
the case where BIOSs are filling out unused entries with -1 instead
of accurately reporting how many entries actually exist.

Paul.
