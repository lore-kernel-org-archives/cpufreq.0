From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: CPU Frequency Scaling
Date: Thu, 2 Sep 2004 14:41:51 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040902124151.GZ29560@poupinou.org>
References: <20040901230103.GB4175@ncrfgs3.ncrfgs>
	<20040902094839.GW29560@poupinou.org>
	<20040902105348.GA2447@inferi.kami.home>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040902105348.GA2447@inferi.kami.home>
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

On Thu, Sep 02, 2004 at 12:53:48PM +0200, Mattia Dongili wrote:
> Uhmmm... :) maybe I didn't understand your objection to cpufreqd, but
> let me spend a couple of words about it.
> 
> Cpufreqd defines working Profiles as:
>     [Profile]
>     name=hi_boost
>     minfreq=907060
>     maxfreq=997500
>     policy=performance
> 

I know that already (and I have no objection since it's configurable via
a configuration file and this can be changed for transmetta
processors which is only my concern even though I don't have one).

Anyway I supposed the OP was talking about powernowd, not cpufreqd,
but maybe I was wrong ;)

Cheers,
-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
