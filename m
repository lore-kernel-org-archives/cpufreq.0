From: Ducrot Bruno <ducrot@poupinou.org>
Subject: Re: [new] event mode on speedstep-smi.
Date: Fri, 5 Sep 2003 15:07:23 +0200
Sender: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Message-ID: <20030905130723.GA408@poupinou.org>
References: <87ekywzjvm.wl%miura@da-cha.org>
	<20030904153013.GJ4401@poupinou.org>
	<87d6egyvfo.wl%miura@da-cha.org> <20030905065604.GD4003@brodo.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20030905065604.GD4003@brodo.de>
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
To: Dominik Brodowski <linux@brodo.de>
Cc: Hiroshi Miura <miura@da-cha.org>, "'cpufreq@www linux org uk'" <cpufreq@www.linux.org.uk>

On Fri, Sep 05, 2003 at 08:56:04AM +0200, Dominik Brodowski wrote:
> On Fri, Sep 05, 2003 at 08:40:11AM +0900, Hiroshi Miura wrote:
> > At Thu, 4 Sep 2003 17:30:13 +0200,
> > Ducrot Bruno wrote:
> > > 
> > > > perf_level:  high 16bit is 0x07d0. this is 2000 in decimal.
> > > > I think this means polling interval is 2000ms.
> > > > 
> > > > This code is based on my original one.
> > > > Ducrot, How about this?
> > > > 
> > > 
> > > I don't understand the real use for.  Does this permit
> > > to switch from performance to powersave when plug in/out ac?
> > > If yes, you can have the exact same behaviour via acpi and acpid,
> > > with an interrupt driven approach instaead of just polling.
> > 
> > Yes, now this only switch when plug in/out ac.
> > I am also using acpi/acpid staff to switch it.
> > My posted code is now only experimental.
> > 
> > BTW, I want to understand Enhanced Intel SpeedStep Technology.
> > 
> > I don't know whether 440MX based M-Pentium III-(M) supports 
> > EIST or not, but I have tried to switch to demand based switching mode. 
> > 
> > Someone said this is a point feature of EIST.
> > At least, M-Pentium-III-(M) (Tullantin) is EIST ready.
> > 
> > If SMI interface supported EIST,  I think something 'polling' may be needed.
> > My code is to try this. I am now looking for EIST function call on SMI.
> 
> I _think_ that within EIST the demand should be detected by the kernel
> based on its load. If your assumption is right, though, such a governor 
> would be a great addition.

EIST feature like 'demand based' is probably done via thermal stuff like
Crusoe.  In short, heat is corelated to a busy processor.

-- 
Ducrot Bruno

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
