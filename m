From: mark.langsdorf@amd.com
Subject: RE: powernow-k8 patch
Date: Thu, 19 Aug 2004 13:32:59 -0500
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <84EA05E2CA77634C82730353CBE3A84310F326@SAUSEXMB1.amd.com>
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
To: ajp@aripollak.com, cpufreq@www.linux.org.uk

Ari Pollak wrote:
> mark.langsdorf@amd.com wrote:
> > AMD recently errata'd the definition of the PSB/PST
> > for recent Athlon 64 and Opteron parts.  The errata
> > allows for a second, identical PST for those parts.
> > The current powernow-k8 driver will not work in
> > PST/PSB mode on those parts because it requires 
> > there be 1 and only 1 PST.
> > 
> > This patch adjusts the powernow-k8 driver to
> > work with that errata.

> Does that happen to fix the bug I reported earlier in powernow-k8?

No.  Your problem is caused by a malformed PST table
that has too many "low" frequency entries and by a 
PSB header that isn't the correct revision (1.4).  
Complain to your BIOS vendor.  Tell them that their 
BIOS does not support PN! on Win2K.

I'm curious as to why it doesn't work under ACPI.  
Can you instantiate the ACPI version and give me the
debug messages?

-Mark Langsdorf
AMD, Inc.
