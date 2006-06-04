From: Dave Jones <davej@redhat.com>
Subject: Re: [PATCH] Hardware P-state driver for AMD Opterons, etc.
Date: Sun, 4 Jun 2006 19:36:59 -0400
Message-ID: <20060604233659.GA2823@redhat.com>
References: <84EA05E2CA77634C82730353CBE3A843053503D0@SAUSEXMB1.amd.com>
	<20060604171840.GB25345@isilmar.linta.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20060604171840.GB25345@isilmar.linta.de>
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
Content-Transfer-Encoding: 7bit
To: "Langsdorf, Mark" <mark.langsdorf@amd.com>, cpufreq@lists.linux.org.uk

On Sun, Jun 04, 2006 at 07:18:40PM +0200, Dominik Brodowski wrote:
 > Hi,
 > 
 > On Fri, Jun 02, 2006 at 05:45:24PM -0500, Langsdorf, Mark wrote:
 > > +static int cpu_family = CPU_OPTERON;
 > 
 > ...
 > 
 > > +	if (cpu_family)
 > > +		return 0;
 > > +
 > 
 > ...
 > 
 > > +	if (cpu_family) {
 > > +		rdmsr(MSR_PSTATE_STATUS, lo, hi);
 > 
 > ...
 > 
 > I'd prefer it if all these if cases would be made explicit:
 > 
 > 
 > 	if (cpu_family == CPU_OPTERON)
 > 
 > as that makes the code much more readable.

I'll second that, but I'll prefer that as a separate diff
as I've already started cleaning up the whitespace damage
in the previous diff, so I'll apply that in a few minutes.

Mark, your editor seems to use a mix of spaces and tabs, which
looks really strange. I've fixed up the few cases that stood out,
so you may want to base your next diff on what turns up in -mm4
when Andrew releases that tree.

		Dave

-- 
http://www.codemonkey.org.uk
