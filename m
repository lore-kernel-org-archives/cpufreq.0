From: Carl Thompson <cet@carlthompson.net>
Subject: Re: Shell script to select the right cpufreq module?
Date: Fri,  2 Apr 2004 15:42:23 -0800
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040402154223.nnph4ww8kw0og48s@carlthompson.net>
References: <4069CA25.2080806@free.fr>
	<20040330203109.GA7141@dominikbrodowski.de>
	<20040331073455.q797owk8kwogcccw@carlthompson.net>
	<20040331154400.GA32308@dominikbrodowski.de>
	<20040331155938.GF25834@redhat.com>
	<20040331205256.y2gjkw0404swwk84@carlthompson.net>
	<20040401124810.GA32536@redhat.com>
	<20040402141522.xpytwck0scwks0w4@carlthompson.net>
	<20040402223659.GH5688@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20040402223659.GH5688@redhat.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Dave Jones <davej@redhat.com>
Cc: Carl Thompson <cet@carlthompson.net>, cpufreq mailing list <cpufreq@www.linux.org.uk>

D'oh!  It appears that this is simply not a mobile CPU.

Thanks,
Carl

Quoting Dave Jones <davej@redhat.com>:

> On Fri, Apr 02, 2004 at 02:15:22PM -0800, Carl Thompson wrote:
>  > Sorry!  Well, then, if it's compiled in how do I activate it so that it
>  > actually works?  No cpufreq functionality seems to be active on
>  > startup...
>
> hmm puzzling. no cpufreq messages at all during boot ?
>
> What does /proc/cpuinfo say, and is there anything in 
> /sys/devices/system/cpu/cpu0/cpufreq ?
> (if so, what are the contents of those files)
>
> 		Dave
