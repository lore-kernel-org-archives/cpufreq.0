From: Cyril Wattebled <neurowork@free.fr>
Subject: Re: Pentium-M minimum clock-freq
Date: Sun, 4 Apr 2004 07:58:03 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040404075803.2fdc50ad.neurowork@free.fr>
References: <200404021824.10912.steffen-hein@gmx.de>
	<20040402164459.GB7034@dominikbrodowski.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20040402164459.GB7034@dominikbrodowski.de>
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
To: cpufreq@www.linux.org.uk


Hi there, 

On Fri, 2 Apr 2004 18:44:59 +0200
Dominik Brodowski <linux@dominikbrodowski.de> wrote:

> On Fri, Apr 02, 2004 at 06:24:10PM +0200, Steffen Hein wrote:
> > I'm currently using Kernel 2.6.4 with a 1.5ghz Pentium-M and the lowest 
> > frequency supported seems to be around 500mhz. However, under Win$ with 
> > current speedstep-drivers installed, it goes as low as 98mhz (with some
> > steps in-between).
> > 
> > Is there any reason, why these frequencies aren't supported by the current 
> > speedstep-driver?
> 
> 'cause the other OS's behaviour is broken, IMHO. It (also) "sells" you 
> throttling as "speedstep": Throttling means the processor is stopped for 
> short times. As long as your processor supports at least the C2 idle state, 
> the system will even consume more energy for any given task if you throttle 
> the CPU. So I think it's a bad idea. Actual speedstep states for the 1.5ghz 
> Pentium-M are 600, 800, 1000, 1200, 1400 and 1500 MHz.

Actually, I have noticed that Windows seems to use Throttling only if the power
adapter is off-line. On my pentium-m 1.7, it throttles the cpu down to 200 mhz
unplugged and goes back to 600 mhz when plugged. The other speed steps are the
same as on linux.

> 
> > Will they be supported in future?
> 
> Maybe -- if multiple cpufreq drivers can be loaded and be running at the
> same time, it'd be possible. I'm not yet sure whether this is a good idea,
> though.

To my opinion, even if C2 state saves even more power that cpu throttling,
there's still a very big advantage in lowering the cpu speed for laptop users,
especially with high speed CPUs: Heat. I have a Pentium-M 1.7 ghz and even if I
use Linux as my main OS, I had to work on Windows from time to time (happily
that doesn't happen too often =]) and I have noticed that the laptop really hot
under linux compared with Windows. During normal use, the meters indicate 48
degrees Celcius on Linux and only 32 under Windows. So heat is also a thing
that might be interresting to be considered because it can be very
unconfortable to use a very hot laptop that burns your knees if you put your
laptop on them, that makes your hands sweat while typing and so on.

I'm not qualified enough to talk about the technical aspect of the current
implementation but would it be technicly possible to use C2 state as the main
speed driver and use throttle on demand, for instance while unplugged to allow
the laptop to be even cooler ?

Cyril
