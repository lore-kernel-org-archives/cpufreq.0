From: Dave Jones <davej@redhat.com>
Subject: Re: Cleanups for powernow-k8
Date: Tue, 13 Jan 2004 23:06:05 +0000
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040113230605.GM14674@redhat.com>
References: <99F2150714F93F448942F9A9F112634C080EF392@txexmtae.amd.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <99F2150714F93F448942F9A9F112634C080EF392@txexmtae.amd.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: paul.devriendt@amd.com
Cc: linux-kernel@vger.kernel.org, cpufreq@www.linux.org.uk, pavel@ucw.cz, linux@brodo.de

On Tue, Jan 13, 2004 at 04:37:13PM -0600, paul.devriendt@amd.com wrote:

 > I have a totally new driver, that I am hoping to release within about
 > a month. (I did target the end of the year, but I got distracted on
 > some other stuff). The new driver :
 >   - uses ACPI to figure out the available p-states. I have seen a *lot*
 >     of buggy BIOSs where the PSB/PST info is wrong or missing,

I've seen a ridiculous amount of broken PST's from folks running the K7 driver
too. Given the complete lack of help from some vendors[1], I think I might
add a minimal ACPI parser there too when I get time, as an alternative
source of info when the PST is obviously crap.

 > I would appreciate some advice on a question ... should I leave the old
 > non-ACPI capability there for those people who do not want to enable ACPI
 > in the kernel ? If so, is this a big ifdef, or is there a better way to do
 > it ? Or should I just say that it is dependent on ACPI, got to have ACPI ?

Part of the justification for cpufreq (at least on x86) was an alternative
for when ACPI just doesn't work, or for when folks either don't want to,
or can't run ACPI (through various other AML bugs for eg).

For minimal parsing of the ACPI P state tables, we shouldn't need the
full-blown interpretor IMO.

		Dave
