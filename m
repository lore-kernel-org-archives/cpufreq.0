From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: Pentium III Coppermine and SiS 630 southbridge
Date: Mon, 1 Mar 2004 16:31:23 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040301153123.GU2869@poupinou.org>
References: <1077880804.12506.22.camel@localhost.localdomain>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <1077880804.12506.22.camel@localhost.localdomain>
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
To: Reynaldo Cordero <reynaldo.cordero@uah.es>
Cc: cpufreq@www.linux.org.uk

On Fri, Feb 27, 2004 at 12:20:04PM +0100, Reynaldo Cordero wrote:
> Hi!
> I have a laptop with Pentium III Coppermine and SiS 630
> southbridge (clevo 2700s [1], kernel 2.6.3 on debian
> unstable).
> 
> I want to recompile it with CPU Frequency scaling,
> and I wondered if I can use:
> 
> - 'powersave' governor
> or
> - 'userspace' governor for userspace frequency scaling
> 
> And which of the drivers are the correct:
> 
> - Intel Speedstep on ICH-M chipsets (ioport interface) or
> - Intel SpeedStep on 440BX/ZX/MX chipsets (SMI interface)
> or anithing else.
> 
> [1] http://hemmerling.free.fr/html/en/linux01.html
> 

AFAIK, there is not even a start to get speedstep working on this
southbridge.  I'm sorry, but nobody don't have even a start of a clue to
get it.

Cheers,

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
