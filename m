From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: ACPI / cpufreq on Presario R3120
Date: Fri, 4 Jun 2004 18:07:32 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040604160732.GJ13782@poupinou.org>
References: <99F2150714F93F448942F9A9F112634C1431B6EA@txexmtae.amd.com>
	<20040604095945.GI13782@poupinou.org>
	<20040604152519.GB8490@dominikbrodowski.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040604152519.GB8490@dominikbrodowski.de>
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

On Fri, Jun 04, 2004 at 05:25:19PM +0200, Dominik Brodowski wrote:
> 
> Hm. First of all, it looks to be not to be invalid behaviour wrt the ACPI
> specification -- even though it doesn't make sense. So, doing this
> workaround in drivers/acpi/processor.c would be way more complicated: we'd
> need to add a flag "VALID_STATE" [remember, processor.c doesn't know about
> frequency table helpers, and I'd like to keep it that way!], check for it in
> every ACPI-cpufreq driver [four at the moment], ... -- even though only
> _one_ needs such a workaround, AFAICS. And it's really easy in powernow-k8,

Well, the spec will claims that p-states are sorted in descending order by
typical power dissipation (in the _PSS).  So yes, you are right since this is
not worded as 'strict descending order' (but well, this suck imho)..

Cheers,

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
