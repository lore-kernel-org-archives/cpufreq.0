From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: Re: Dothan VID# identification script (was Re: [ACPI]
	Speedstep-centrino problems)
Date: Sun, 13 Feb 2005 10:40:29 +0100
Message-ID: <20050213094029.GC8081@dominikbrodowski.de>
References: <0FEA36BB2ABDF44FAAFEB7A75367C07A0117DCE4@alaska.condis.es>
	<420B5CB1.2090804@bartol.udel.edu>
	<20050210172904.GB6824@isilmar.linta.de>
	<420E911B.1060405@bartol.udel.edu>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <420E911B.1060405@bartol.udel.edu>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rich Townsend <rhdt@bartol.udel.edu>, cpufreq@lists.linux.org.uk
Cc: Simon Moore <Simon_Moore@condisline.com>

On Sat, Feb 12, 2005 at 06:28:27PM -0500, Rich Townsend wrote:
> Of course, we can't guarantee that there will always be a match; or that 
> there won't be duplicate matches. Also, this approach relies on having 
> ACPI P-states, to build up the frequency/voltage table. However, it 
> still seems to me to be a pretty robust way of determining the VID# in a 
> system, and one that could be incorporated into speedstep-centrino. 
> Dominik, what do you think?

It indeed seems somewhat robust to me, I'd like to get Venkatesh's input on
this, though. "Transient voltages" may pose a problem, though...

I wouldn't favor for inclusion into speedstep-centrino, though -- one
cpufreq driver requiring at first one other to run, then to unload the other
with speedstep-centrino taking over... no, that doesn't _feel_ right. I
wouldn't vote against including the Dothan tables but only using them if the
user passes a parameter "vid=[a-f]", though.

Just my $0.02,

	Dominik

PS: moved this discussion to the cpufreq list which seems more appropriate
for this stuff.
