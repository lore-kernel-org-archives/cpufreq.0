From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: [PATCH 2.6] powernow-k7 acpi support.
Date: Mon, 9 Feb 2004 19:29:57 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040209182957.GF13262@poupinou.org>
References: <20040209132659.GY13262@poupinou.org>
	<20040209150519.GA6531@dominikbrodowski.de>
	<20040209175000.GE13262@poupinou.org>
	<20040209180553.GA30914@dominikbrodowski.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040209180553.GA30914@dominikbrodowski.de>
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
Cc: davej@redhat.com, Bruno Ducrot <ducrot@poupinou.org>

On Mon, Feb 09, 2004 at 07:05:53PM +0100, Dominik Brodowski wrote:
> On Mon, Feb 09, 2004 at 06:50:00PM +0100, Bruno Ducrot wrote:
> > 
> > How about that one?
> 
> Looks much better, IMO.

Thanks.

> 
> >  By now, I'm a little puzzled with the fsb stuff,
> > though.  A first idea may be to look into what say ACPI about the
> > frequency, and deduce the fsb from, but I don't like it.
> 
> So you wouldn't like
> 
> 	fsb = (acpi_processor_perf->states[i].core_frequency * 10) / fid_codes[fid]
> 
> ? Why?

Because I would much prefer a generic function get_amd_fsb(),
independant from bios.

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
